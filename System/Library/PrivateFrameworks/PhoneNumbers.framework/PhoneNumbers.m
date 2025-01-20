uint64_t pn_default_log()
{
  if (pn_default_log_onceToken != -1) {
    dispatch_once(&pn_default_log_onceToken, &__block_literal_global);
  }
  return pn_default_log_sLog;
}

os_log_t __pn_default_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.phonenumbers", "default");
  pn_default_log_sLog = (uint64_t)result;
  return result;
}

uint64_t _PNCopyInternationalCodeForCountry()
{
  return MEMORY[0x270F1B750]();
}

uint64_t _PNCopyNationalDirectDialingPrefixForCountry()
{
  return MEMORY[0x270F1B758]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}