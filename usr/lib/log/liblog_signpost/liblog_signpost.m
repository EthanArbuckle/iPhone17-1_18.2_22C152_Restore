uint64_t OSLogCopyFormattedString(const char *a1)
{
  int v1;
  id v2;
  __CFString *v3;
  uint64_t vars8;

  v1 = strncmp(a1, "metrics", 8uLL);
  v2 = objc_alloc(MEMORY[0x263F086A0]);
  if (v1) {
    v3 = @"[Unknown signpost data]";
  }
  else {
    v3 = @"[Performance Metrics]";
  }

  return [v2 initWithString:v3];
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}