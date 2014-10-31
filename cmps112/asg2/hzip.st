#! /apps/smalltalk-3.2.5/gst -f 


"Some function used and/or adapted from classfile charfreq.st"

nl := Character nl.

Character extend [
    isPrint [
    ^ (Character space <= self) & (self <= $~)
    ]
    visible [
	self isPrint ifTrue: [^ '$', self asString]
	ifFalse: [^ self asInteger printStringRadix: 8]
    ]
]

Object subclass: ZeroArray [
    |theArray|

    ZeroArray class >> new [
	self shouldNotImplement.
    ]

    ZeroArray class >> new: size [
	|result|
	result := super new.
	result init: size.
	^ result
    ]

    init: size [
	theArray := Array new: size.
    ]

    size [
	^ theArray size.
    ]

    at: index [
	^ theArray at: index + 1.
    ]

    at: index put: value [
	^ theArray at: index + 1 put: value.
    ]

    incr: index [
	(self at: index) isNil
	ifTrue: [ self at: index put: 0].
	self at: index put: (self at: index) + 1.
    ]

    keysAndValuesDo: aBlock [
	(0 to: (self size) - 1) do: [:index |
	    aBlock value: index value: (self at: index).
	]
    ]

]
"""
freqtable := ZeroArray new: 256.

[stdin atEnd not] whileTrue: [
    |ordChar|
    ordChar := stdin next asInteger.
    freqtable incr: ordChar.
].

freqtable keysAndValuesDo: [:key :value |
    (value notNil and: [value > 0]) ifTrue: [
	stdout << 'freq[' << key asCharacter visible << ']=' << value
	    << nl.
    ]
].

"""

Object subclass: Leaf [
    |char count|
    char [ ^ char ]
    count [ ^ count ]

    Leaf class >> new [
	self shouldNotImplement
    ]

    Leaf class >> new: aChar count: aCount [
	|result|
	result := super new.
	result setChar: aChar andCount: aCount.
	^result
    ]

    setChar: aChar andCount: aCount [
	char := aChar.
	count := aCount.
    ]

    <= other [
	^ (count < other count)
	| ((count = other count) & (char <= other char))
    ]

    printBase: aStream [
	^ aStream << self class << '(' << char << ',' << count
    ]

    printOn: aStream [
	(self printBase: aStream) << ')'.
    ]

    inorder: visitor prefix: string [
	visitor value: char value: string.
    ]
]
