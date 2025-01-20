@interface ArchiveRegisteredClients
@end

@implementation ArchiveRegisteredClients

void ___ArchiveRegisteredClients_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)qword_1EB402C98;
  qword_1EB402C98 = (uint64_t)v0;
}

intptr_t ___ArchiveRegisteredClients_block_invoke_2()
{
  dispatch_semaphore_t v0 = (void *)MEMORY[0x192FDC630]();
  v1 = _ArchiveFilePath();
  uint64_t v2 = _RegisteredClients();
  v3 = (void *)v2;
  if (v1)
  {
    if (v2)
    {
      v4 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Archiving Scheduled Activities", v10, 2u);
      }

      v5 = (void *)MEMORY[0x1E4F28DB0];
      v6 = _RegisteredClients();
      v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

      if (v7) {
        [v7 writeToFile:v1 atomically:1];
      }
      PKExcludePathFromBackup((uint64_t)v1);
    }
    else
    {
      v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      v8 = _ArchiveFilePath();
      [v7 removeItemAtPath:v8 error:0];
    }
  }

  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_1EB402C98);
}

@end