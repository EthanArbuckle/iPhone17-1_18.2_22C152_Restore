int main(int argc, const char **argv, const char **envp)
{
  int result;

  swift_task_create();
  swift_task_getMainExecutor();
  swift_job_run();
  result = swift_task_asyncMainDrainQueue();
  __break(1u);
  return result;
}

uint64_t sub_100003484()
{
  v0[2] = swift_task_getMainExecutor();
  v0[3] = v1;
  nullsub_1();
  v2 = (void *)swift_task_alloc();
  v0[4] = v2;
  void *v2 = v0;
  v2[1] = sub_100003520;
  return static SNDaemon.soundanalysisdLaunch()();
}

uint64_t sub_100003520()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 16);
  if (v0) {
    v5 = sub_10000368C;
  }
  else {
    v5 = sub_10000365C;
  }
  return _swift_task_switch(v5, v4, v3);
}

void sub_10000365C()
{
}

uint64_t sub_10000368C()
{
  return _swift_errorInMain(*(void *)(v0 + 40));
}

uint64_t sub_100003694()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003720;
  return sub_100003484();
}

uint64_t sub_100003720()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void exit(int a1)
{
}

uint64_t swift_job_run()
{
  return _swift_job_run();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_asyncMainDrainQueue()
{
  return _swift_task_asyncMainDrainQueue();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}