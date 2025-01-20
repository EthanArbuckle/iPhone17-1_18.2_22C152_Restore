uint64_t AXSpeechTransformText(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F7D760](a1, a2, 0, 0);
}

uint64_t AXSpeechTransformTextWithLanguageAndVoiceIdentifier()
{
  return MEMORY[0x270F7D768]();
}

uint64_t AXSpeechTransformTextWithLanguage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F7D768](a1, a2, a3, 0, a4);
}

uint64_t AXSpeechLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x270F7D750]();
}