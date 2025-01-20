uint64_t NSStringFromPRUISwitcherLayoutMode()
{
  uint64_t v0;
  uint64_t vars8;

  v0 = modeFromPRUISwitcherLayoutMode();
  return MEMORY[0x1F4145BE0](v0);
}

uint64_t PRUISwitcherLayoutTransitionAnimationSettings()
{
  return MEMORY[0x1F4145BF8]();
}

uint64_t PRUISwitcherLayoutDeflationAnimationSettings()
{
  return MEMORY[0x1F4145BF0]();
}

uint64_t PRUISwitcherLayoutBouncingAnimationSettings()
{
  return MEMORY[0x1F4145BE8]();
}

uint64_t modeFromPRUISwitcherLayoutMode()
{
  return MEMORY[0x1F4145C08]();
}