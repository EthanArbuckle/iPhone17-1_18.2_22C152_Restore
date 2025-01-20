@interface BKFirstBootKernelSemaphoreToken
+ (id)token;
- (BKFirstBootKernelSemaphoreToken)init;
- (BOOL)isTokenSet;
- (NSString)description;
- (void)_revertToFirstBoot;
- (void)unsetToken;
@end

@implementation BKFirstBootKernelSemaphoreToken

- (void)_revertToFirstBoot
{
  if (self->_semaphoreExists)
  {
    if (sem_unlink("backboardd.firstboot_check"))
    {
      v3 = sub_10005F9DC();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v4 = *__error();
        int v5 = 136446466;
        v6 = "backboardd.firstboot_check";
        __int16 v7 = 1024;
        int v8 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to delete semaphore %{public}s for first boot token. Error = %d", (uint8_t *)&v5, 0x12u);
      }
    }
    else
    {
      self->_semaphoreExists = 0;
    }
  }
}

- (void)unsetToken
{
  if (!self->_semaphoreExists)
  {
    v3 = sem_open("backboardd.firstboot_check", 512, 256, 0);
    if (v3 == (sem_t *)-1)
    {
      int v4 = sub_10005F9DC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *__error();
        *(_DWORD *)buf = 136446466;
        __int16 v7 = "backboardd.firstboot_check";
        __int16 v8 = 1024;
        int v9 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s for first boot token. Error = %d", buf, 0x12u);
      }
    }
    else
    {
      self->_semaphoreExists = 1;
      sem_close(v3);
    }
  }
}

- (BOOL)isTokenSet
{
  return !self->_semaphoreExists;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendBool:-[BKFirstBootKernelSemaphoreToken isTokenSet](self, "isTokenSet") withName:@"isTokenSet"];
  int v5 = [v3 build];

  return (NSString *)v5;
}

- (BKFirstBootKernelSemaphoreToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKFirstBootKernelSemaphoreToken;
  v2 = [(BKFirstBootKernelSemaphoreToken *)&v6 init];
  if (v2)
  {
    v3 = sem_open("backboardd.firstboot_check", 0);
    if (v3 == (sem_t *)-1)
    {
      char v4 = 0;
    }
    else
    {
      sem_close(v3);
      char v4 = 1;
    }
    v2->_semaphoreExists = v4;
  }
  return v2;
}

+ (id)token
{
  v2 = objc_alloc_init(BKFirstBootKernelSemaphoreToken);

  return v2;
}

@end