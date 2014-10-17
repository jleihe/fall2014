class HelloWorld {
    Void main(Str[] args) {
        echo("Hello World!")
	if (args != null && args[0] is Str)
		echo("Fantom Says: ${args[0]}!")
    }
}
