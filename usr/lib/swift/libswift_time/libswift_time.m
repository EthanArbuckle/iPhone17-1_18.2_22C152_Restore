uint64_t timespec.init(_:)()
{
  return Duration.components.getter();
}

void Duration.init(_:)()
{
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x270F9FF68]();
}