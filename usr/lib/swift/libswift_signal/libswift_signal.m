uint64_t SIG_IGN.getter()
{
  return 1;
}

uint64_t SIG_DFL.getter()
{
  return 0;
}

uint64_t SIG_ERR.getter()
{
  return -1;
}

uint64_t SIG_HOLD.getter()
{
  return 5;
}