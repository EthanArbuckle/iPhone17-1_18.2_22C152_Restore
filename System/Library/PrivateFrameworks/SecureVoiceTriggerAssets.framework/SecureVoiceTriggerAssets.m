uint64_t SecureVoiceTriggerAssets.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(void *)(result + 16) = 0x3FF0000000000000;
  return result;
}

uint64_t SecureVoiceTriggerAssets.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0x3FF0000000000000;
  return result;
}

Swift::Double __swiftcall SecureVoiceTriggerAssets.SecureVoiceTriggerAssetsVersion()()
{
  return 1.0;
}

uint64_t SecureVoiceTriggerAssets.deinit()
{
  return v0;
}

uint64_t SecureVoiceTriggerAssets.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for SecureVoiceTriggerAssets()
{
  return self;
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}