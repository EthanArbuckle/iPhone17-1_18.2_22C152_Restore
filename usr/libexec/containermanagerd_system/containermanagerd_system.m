uint64_t start()
{
  _containermanagerd_main();
  return 0;
}

uint64_t _containermanagerd_main()
{
  return __containermanagerd_main();
}