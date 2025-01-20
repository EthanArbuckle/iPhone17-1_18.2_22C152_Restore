uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  FILE *v8;
  FILE *v9;
  id v10;
  id v12;
  id v13;

  v1 = objc_opt_new();
  v13 = 0;
  v2 = [v1 getStateDumpWithError:&v13];
  v3 = v13;

  if (v2)
  {
    v4 = +[NSFileHandle fileHandleWithStandardOutput];
    v12 = v3;
    v5 = [v2 writeToFileHandle:v4 error:&v12];
    v6 = v12;

    if (v5)
    {
      v7 = 0;
    }
    else
    {
      v9 = __stderrp;
      v10 = [v6 description];
      fprintf(v9, "could not dump: %s\n", (const char *)[v10 UTF8String]);

      v7 = 1;
    }
  }
  else
  {
    v8 = __stderrp;
    v4 = [v3 description];
    fprintf(v8, "could not get dump: %s\n", (const char *)[v4 UTF8String]);
    v7 = 1;
    v6 = v3;
  }

  return v7;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardOutput];
}

id objc_msgSend_writeToFileHandle_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFileHandle:x0 error:x1];
}