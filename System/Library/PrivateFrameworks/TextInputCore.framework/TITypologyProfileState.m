@interface TITypologyProfileState
+ (BOOL)_removePersistedStateAtURL:(id)a3;
+ (BOOL)removePersistedState;
+ (BOOL)supportsSecureCoding;
+ (id)_typologyProfileStateFromURL:(id)a3;
+ (id)defaultPersistentURL;
+ (id)typologyProfileStateFromPersistedState;
- (BOOL)_authenticateHashToken:(id)a3 forProfileInstallationDate:(id)a4 userNotificationDate:(id)a5 userResponse:(id)a6;
- (BOOL)_persistStateToURL:(id)a3;
- (BOOL)persistState;
- (NSData)salt;
- (NSDate)profileInstallationDate;
- (NSDate)userNotificationDate;
- (NSString)userResponse;
- (TITypologyProfileState)initWithCoder:(id)a3;
- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3;
- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5;
- (id)_hashTokenForProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5;
- (id)hashForString:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProfileInstallationDate:(id)a3;
- (void)setSalt:(id)a3;
- (void)setUserNotificationDate:(id)a3;
- (void)setUserResponse:(id)a3;
@end

@implementation TITypologyProfileState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
  objc_storeStrong((id *)&self->_userNotificationDate, 0);

  objc_storeStrong((id *)&self->_profileInstallationDate, 0);
}

- (void)setSalt:(id)a3
{
}

- (void)setUserResponse:(id)a3
{
}

- (NSString)userResponse
{
  return self->_userResponse;
}

- (void)setUserNotificationDate:(id)a3
{
}

- (NSDate)userNotificationDate
{
  return self->_userNotificationDate;
}

- (void)setProfileInstallationDate:(id)a3
{
}

- (NSDate)profileInstallationDate
{
  return self->_profileInstallationDate;
}

- (BOOL)persistState
{
  v3 = [(id)objc_opt_class() defaultPersistentURL];
  LOBYTE(self) = [(TITypologyProfileState *)self _persistStateToURL:v3];

  return (char)self;
}

- (BOOL)_persistStateToURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(TITypologyProfileState *)self encodeWithCoder:v5];
  v6 = [v5 encodedData];
  v7 = v6;
  if (v6)
  {
    id v12 = 0;
    char v8 = [v6 writeToURL:v4 options:1073741825 error:&v12];
    id v9 = v12;
    if ((v8 & 1) == 0)
    {
      v10 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "Unable to persist state: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  profileInstallationDate = self->_profileInstallationDate;
  userNotificationDate = self->_userNotificationDate;
  v7 = self->_userResponse;
  char v8 = userNotificationDate;
  v11 = profileInstallationDate;
  id v9 = a3;
  v10 = [(TITypologyProfileState *)self _hashTokenForProfileInstallationDate:v11 userNotificationDate:v8 userResponse:v7];
  [v9 encodeObject:v11 forKey:@"InstallDate"];
  [v9 encodeObject:v8 forKey:@"UserNotificationDate"];
  [v9 encodeObject:v7 forKey:@"UserResponse"];

  [v9 encodeObject:v10 forKey:@"HashToken"];
}

- (TITypologyProfileState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstallDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserNotificationDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserResponse"];
  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HashToken"];

  if ([(TITypologyProfileState *)self _authenticateHashToken:v8 forProfileInstallationDate:v5 userNotificationDate:v6 userResponse:v7])
  {
    self = [(TITypologyProfileState *)self initWithProfileInstallationDate:v5 userNotificationDate:v6 userResponse:v7];
    id v9 = self;
  }
  else
  {
    v10 = TITypologyProfileStateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "Unable to instantiate decoded typology profile state: authentication failed.", v12, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_areValidFieldValues(v8, v9, v10))
  {
    v20.receiver = self;
    v20.super_class = (Class)TITypologyProfileState;
    v11 = [(TITypologyProfileState *)&v20 init];
    if (v11)
    {
      uint64_t v12 = [v8 copy];
      profileInstallationDate = v11->_profileInstallationDate;
      v11->_profileInstallationDate = (NSDate *)v12;

      uint64_t v14 = [v9 copy];
      userNotificationDate = v11->_userNotificationDate;
      v11->_userNotificationDate = (NSDate *)v14;

      uint64_t v16 = [v10 copy];
      userResponse = v11->_userResponse;
      v11->_userResponse = (NSString *)v16;
    }
    self = v11;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 distantPast];
  v7 = [(TITypologyProfileState *)self initWithProfileInstallationDate:v5 userNotificationDate:v6 userResponse:@"None"];

  return v7;
}

- (BOOL)_authenticateHashToken:(id)a3 forProfileInstallationDate:(id)a4 userNotificationDate:(id)a5 userResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (!v14)
  {
    uint64_t v16 = 0;
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = 0;
    uint64_t v16 = v14;
    goto LABEL_11;
  }
  uint64_t v15 = [v14 length];

  if (!v15 || !_areValidFieldValues(v11, v12, v13))
  {
    BOOL v17 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = [(TITypologyProfileState *)self _hashTokenForProfileInstallationDate:v11 userNotificationDate:v12 userResponse:v13];
  if (![v16 length] || (objc_msgSend(v16, "isEqualToString:", v14) & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v17 = 1;
LABEL_11:

LABEL_13:
  return v17;
}

- (id)_hashTokenForProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_areValidFieldValues(v8, v9, v10))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v11 setLocale:v12];

    [v11 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    id v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [v11 setTimeZone:v13];

    id v14 = [v11 stringFromDate:v8];
    uint64_t v15 = [v11 stringFromDate:v9];
    uint64_t v16 = [NSString stringWithFormat:@"profileInstalled:%@, userNotification:%@, userResponse:%@", v14, v15, v10];
    BOOL v17 = [(TITypologyProfileState *)self hashForString:v16];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (NSData)salt
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  salt = self->_salt;
  if (!salt)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B9A0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5D0], @"typologyProfileStateSalt");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.TextInput");
    id v11 = 0;
    SecItemCopyMatching(Mutable, (CFTypeRef *)&v11);
    if (v11)
    {
      v6 = self->_salt;
      self->_salt = v11;
    }
    if (!self->_salt)
    {
      arc4random_buf(__buf, 0x20uLL);
      v7 = (NSData *)CFDataCreate(v4, __buf, 32);
      id v8 = self->_salt;
      self->_salt = v7;

      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], self->_salt);
      if (SecItemAdd(Mutable, 0))
      {
        id v9 = self->_salt;
        self->_salt = 0;
      }
    }
    CFRelease(Mutable);
    salt = self->_salt;
  }

  return salt;
}

- (id)hashForString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (__CFString *)a3;
  CFDataRef v5 = [(TITypologyProfileState *)self salt];
  if (v5)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
    if (CStringPtr)
    {
      v7 = CStringPtr;
      CC_LONG v8 = strlen(CStringPtr);
      CC_SHA256_Update(&c, v7, v8);
    }
    else
    {
      CFIndex Length = CFStringGetLength(v4);
      if (Length >= 1)
      {
        CFIndex v11 = Length;
        CFIndex v12 = 0;
        do
        {
          CFIndex usedBufLen = 0;
          v24.location = v12;
          v24.length = v11;
          CFIndex Bytes = CFStringGetBytes(v4, v24, 0x8000100u, 0, 0, buffer, 512, &usedBufLen);
          CC_SHA256_Update(&c, buffer, usedBufLen);
          v12 += Bytes;
          BOOL v14 = v11 <= Bytes;
          v11 -= Bytes;
        }
        while (!v14);
      }
    }
    BytePtr = CFDataGetBytePtr(v5);
    CC_LONG v16 = CFDataGetLength(v5);
    CC_SHA256_Update(&c, BytePtr, v16);
    CC_SHA256_Final(buffer, &c);
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 64);
    for (uint64_t i = 0; i != 32; ++i)
      CFStringAppendFormat(Mutable, 0, @"%x", buffer[i]);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)removePersistedState
{
  v3 = TITypologyProfileStateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEFAULT, "Removing persisted state", v7, 2u);
  }

  CFAllocatorRef v4 = [a1 defaultPersistentURL];
  char v5 = [a1 _removePersistedStateAtURL:v4];

  return v5;
}

+ (BOOL)_removePersistedStateAtURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  char v5 = [v3 defaultManager];
  id v12 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v12];

  id v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v7)
    {
      CC_LONG v8 = [v7 domain];
      if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v9 = [v7 code];

        if (v9 == 4)
        {
          id v10 = TITypologyProfileStateLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_INFO, "No persisted state to remove", buf, 2u);
          }
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    id v10 = TITypologyProfileStateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "Failed to remove persisted state: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

+ (id)typologyProfileStateFromPersistedState
{
  v3 = [a1 defaultPersistentURL];
  id v4 = [a1 _typologyProfileStateFromURL:v3];

  return v4;
}

+ (id)_typologyProfileStateFromURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:&v15];
  id v5 = v15;
  char v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      id v10 = [v5 domain];
      if ([v10 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v11 = [v6 code];

        if (v11 == 260)
        {
          id v7 = TITypologyProfileStateLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_INFO, "No persisted state found.", buf, 2u);
          }
LABEL_15:
          uint64_t v9 = 0;
          id v8 = v6;
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    id v7 = TITypologyProfileStateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_ERROR, "Unable to read persisted state: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  id v14 = v5;
  id v7 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v14];
  id v8 = v14;

  if (v7)
  {
    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithCoder:v7];
  }
  else
  {
    id v12 = TITypologyProfileStateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_ERROR, "Failed to initialize keyed unarchiver with persisted data: %@", buf, 0xCu);
    }

    id v7 = 0;
    uint64_t v9 = 0;
  }
LABEL_16:

  return v9;
}

+ (id)defaultPersistentURL
{
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:TI_KB_USER_DIRECTORY()];
  v3 = [v2 URLByAppendingPathComponent:@"typologyProfileState.dat"];

  return v3;
}

@end