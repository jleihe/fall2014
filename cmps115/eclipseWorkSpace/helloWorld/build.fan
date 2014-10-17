zusing build
class Build : build::BuildPod
{
  new make()
  {
    podName = "helloWorld"
    summary = ""
    srcDirs = [`fan/`]
    depends = ["sys 1.0 util web wisp"]
  }
}
