@interface FPAirFair
- (BOOL)Jaz0t2BPNjwE;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (FPAirFair)init;
- (id)supportedDataclasses;
- (int)DrFjYlmSKahjfJzgmaPvs:(FairPlayHWInfo_ *)a3;
- (int)ENaUvadPgTNQtAOA;
- (int)FVxWQcJol3R;
- (int)MvKgJWHiyPi9jHcCD1zBrVK7F:(id)a3 bytes:(char *)a4 size:(unsigned int *)a5;
- (int)U0DV0QxFFjyMatlbDyqSZ4s3d:(id)a3;
- (int)cIjYbQiRD8mj9H;
- (int)wkiHcH3uUYkLWEOOs:(char *)a3 reqSize:(unsigned int)a4 fileName:(id)a5;
- (void)dealloc;
- (void)syncEndedWithSuccess:(BOOL)a3;
@end

@implementation FPAirFair

- (FPAirFair)init
{
  v5.receiver = self;
  v5.super_class = (Class)FPAirFair;
  v2 = [(FPAirFair *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FPAirFair *)v2 ENaUvadPgTNQtAOA];
  }
  return v3;
}

- (void)dealloc
{
  unsigned int HPD8FhhtYi5OC5SPY = self->HPD8FhhtYi5OC5SPY;
  if (HPD8FhhtYi5OC5SPY)
  {
    VLxCLgDpiF(HPD8FhhtYi5OC5SPY);
    self->unsigned int HPD8FhhtYi5OC5SPY = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FPAirFair;
  [(FPAirFair *)&v4 dealloc];
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"Keybag"];
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7
{
  uint64_t v21 = 0;
  unsigned int v20 = 0;
  uint64_t v19 = 0;
  self->LnGBbUJQLDA = a5;
  df35957c4e0();
  if (!v10 || (uint64_t v11 = [(FPAirFair *)self ENaUvadPgTNQtAOA], !v11))
  {
    uint64_t v12 = a6
       && ([@"11.0.2.0" compare:a6 options:64] == (id)-1
        || ![@"11.0.2.0" compare:a6 options:64])
        ? 110103
        : 0;
    Mt76Vq80ux(self->HPD8FhhtYi5OC5SPY, 0, v12, 7, (uint64_t)&v21, (uint64_t)&v20);
    uint64_t v11 = v13;
    if (!v13)
    {
      uint64_t v11 = [(FPAirFair *)self FVxWQcJol3R];
      if (!v11)
      {
        uint64_t v11 = [(FPAirFair *)self wkiHcH3uUYkLWEOOs:v21 reqSize:v20 fileName:@"/var/mobile/Media/AirFair/sync/afsync.rq"];
        if (!v11)
        {
          jumT7rcoieclCtxS2rgJ(self->LnGBbUJQLDA, v21, v20, (uint64_t)&v19);
          uint64_t v11 = v14;
          if (!v14) {
            uint64_t v11 = [(FPAirFair *)self wkiHcH3uUYkLWEOOs:v19 reqSize:0 fileName:@"/var/mobile/Media/AirFair/sync/afsync.rq.sig"];
          }
        }
      }
    }
  }
  if (v21) {
    jEHf8Xzsv8K(v21);
  }
  if (v19) {
    X5EvIJWqdcALcjaxX6Pl(v19);
  }
  if (v11)
  {
    v15 = +[NSString stringWithFormat:@"AirFair:prepareForSyncWithHostAnchor failed with error %d", v11];
    v16 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"AirFair" code:(int)v11 userInfo:0];
    if (v17) {
      *a7 = v17;
    }
  }
  return v11 == 0;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  uint64_t v19 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  int v16 = 0;
  if (![(FPAirFair *)self Jaz0t2BPNjwE]) {
    goto LABEL_15;
  }
  uint64_t v8 = [(FPAirFair *)self MvKgJWHiyPi9jHcCD1zBrVK7F:@"/var/mobile/Media/AirFair/sync/afsync.rs.sig" bytes:&v17 size:&v16];
  if (!v8)
  {
    uint64_t v8 = [(FPAirFair *)self MvKgJWHiyPi9jHcCD1zBrVK7F:@"/var/mobile/Media/AirFair/sync/afsync.rs" bytes:&v19 size:&v18];
    if (!v8)
    {
      CFUnnB0JdUjJ5CNJMkDS();
      uint64_t v8 = v9;
      if (!v9)
      {
        lCUad();
        uint64_t v8 = v10;
      }
    }
  }
  if (v17) {
    X5EvIJWqdcALcjaxX6Pl(v17);
  }
  if (v19) {
    free(v19);
  }
  if (v8)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"AirFair:reconcileSync failed with error %d", v8];
    uint64_t v12 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"AirFair.syncbundle reconsileSync" code:(int)v8 userInfo:0];
    if (v13)
    {
      uint64_t v14 = v13;
      LOBYTE(v13) = 0;
      *a6 = v14;
    }
  }
  else
  {
LABEL_15:
    LOBYTE(v13) = 1;
  }
  return (char)v13;
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  uint64_t v3 = [(FPAirFair *)self cIjYbQiRD8mj9H];
  if (v3 != -42112 && v3)
  {
    objc_super v4 = +[NSString stringWithFormat:@"AirFair:syncEndedWithSuccess failed with error %d", v3];
    objc_super v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (BOOL)Jaz0t2BPNjwE
{
  memset(&v3.st_size, 0, 48);
  if (!lstat((const char *)objc_msgSend(@"/var/mobile/Media/AirFair/sync/afsync.rs", "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v3))return v3.st_size != 0; {
  __error();
  }
  return 0;
}

- (int)FVxWQcJol3R
{
  *__error() = 0;
  mode_t v2 = umask(0);
  if (mkdir((const char *)[@"/var/mobile/Media/AirFair/" UTF8String], 0x1F6u) < 0
    && *__error() != 17)
  {
    int v3 = -42110;
  }
  else
  {
    *__error() = 0;
    int v3 = 0;
    if (mkdir((const char *)[@"/var/mobile/Media/AirFair/sync/" UTF8String], 0x1F6u) < 0)
    {
      if (*__error() == 17) {
        int v3 = 0;
      }
      else {
        int v3 = -42110;
      }
    }
  }
  umask(v2);
  return v3;
}

- (int)wkiHcH3uUYkLWEOOs:(char *)a3 reqSize:(unsigned int)a4 fileName:(id)a5
{
  v7 = (const char *)[a5 UTF8String];
  mode_t v8 = umask(0);
  int v9 = open(v7, 1825, 420);
  if (v9 < 0)
  {
    if (*__error() == 2) {
      int v11 = -42112;
    }
    else {
      int v11 = -42110;
    }
  }
  else
  {
    int v10 = v9;
    if (write(v9, a3, a4) == a4) {
      int v11 = 0;
    }
    else {
      int v11 = -42110;
    }
    close(v10);
  }
  umask(v8);
  return v11;
}

- (int)MvKgJWHiyPi9jHcCD1zBrVK7F:(id)a3 bytes:(char *)a4 size:(unsigned int *)a5
{
  memset(&v14, 0, sizeof(v14));
  int v7 = open((const char *)[a3 UTF8String], 272, 0);
  if (v7 < 0)
  {
    int v9 = 0;
    unsigned int st_size = 0;
    if (*__error() == 2) {
      int v11 = -42112;
    }
    else {
      int v11 = -42110;
    }
  }
  else
  {
    int v8 = v7;
    if (fstat(v7, &v14))
    {
      int v9 = 0;
      unsigned int st_size = 0;
      int v11 = -42110;
    }
    else
    {
      unsigned int st_size = v14.st_size;
      int v9 = malloc_type_malloc(LODWORD(v14.st_size), 0x1A258464uLL);
      if (v9)
      {
        ssize_t v12 = read(v8, v9, v14.st_size);
        if (v12 == v14.st_size) {
          int v11 = 0;
        }
        else {
          int v11 = -42110;
        }
      }
      else
      {
        int v11 = -42028;
      }
    }
    close(v8);
    if (v9 && v11)
    {
      free(v9);
      int v9 = 0;
      unsigned int st_size = 0;
    }
  }
  *a4 = (char *)v9;
  *a5 = st_size;
  return v11;
}

- (int)U0DV0QxFFjyMatlbDyqSZ4s3d:(id)a3
{
  int v3 = (const char *)objc_msgSend(a3, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0);
  if (lstat(v3, &v6))
  {
    if (*__error() == 2) {
      return -42112;
    }
    else {
      return -42110;
    }
  }
  else
  {
    int v4 = -42110;
    if ((v6.st_mode & 0xF000) != 0xA000)
    {
      if (unlink(v3)) {
        return -42110;
      }
      else {
        return 0;
      }
    }
  }
  return v4;
}

- (int)cIjYbQiRD8mj9H
{
  [(FPAirFair *)self U0DV0QxFFjyMatlbDyqSZ4s3d:@"/var/mobile/Media/AirFair/sync/afsync.rq"];
  [(FPAirFair *)self U0DV0QxFFjyMatlbDyqSZ4s3d:@"/var/mobile/Media/AirFair/sync/afsync.rq.sig"];
  [(FPAirFair *)self U0DV0QxFFjyMatlbDyqSZ4s3d:@"/var/mobile/Media/AirFair/sync/afsync.rs"];

  return [(FPAirFair *)self U0DV0QxFFjyMatlbDyqSZ4s3d:@"/var/mobile/Media/AirFair/sync/afsync.rs.sig"];
}

- (int)DrFjYlmSKahjfJzgmaPvs:(FairPlayHWInfo_ *)a3
{
  if (!a3) {
    return -42023;
  }
  CFStringRef v4 = (const __CFString *)MGCopyAnswer();
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFStringGetTypeID()) {
    return -42023;
  }
  if (CFStringGetCString(v5, buffer, 41, 0x8000100u))
  {
    size_t v7 = strlen(buffer);
    zxcm2Qme0x((uint64_t)buffer, v7, (uint64_t)a3);
    int v9 = v8;
  }
  else
  {
    int v9 = -42023;
  }
  CFRelease(v5);
  return v9;
}

- (int)ENaUvadPgTNQtAOA
{
  memset(v12, 0, sizeof(v12));
  int v3 = [(FPAirFair *)self DrFjYlmSKahjfJzgmaPvs:v12];
  if (!v3)
  {
    uint64_t v5 = XtCqEf5X(0, (uint64_t)v12, (uint64_t)"/var/mobile/Media/iTunes_Control/iTunes/", (uint64_t)&self->HPD8FhhtYi5OC5SPY);
    int v3 = v5;
    if (v5)
    {
      if (v5 == -42180)
      {
        int v3 = -42180;
        CFTypeID v6 = +[NSString stringWithFormat:@"AirFair plugin failed to initialize %d - to be expected on boot before SpringBoard (rdar://9874159)", 4294925116];
        size_t v7 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int v11 = v6;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          return -42180;
        }
      }
      else
      {
        int v8 = +[NSString stringWithFormat:@"AirFair plugin failed to initialize %d", v5];
        int v9 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int v11 = v8;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v3;
}

@end