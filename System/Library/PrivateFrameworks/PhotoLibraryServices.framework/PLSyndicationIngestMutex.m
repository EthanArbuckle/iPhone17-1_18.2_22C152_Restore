@interface PLSyndicationIngestMutex
- (BOOL)shouldStopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3;
- (PLSyndicationIngestMutex)initWithDatabaseContext:(id)a3;
- (id)_obtainSyndicationIngestLibraryIfPossibleWithIdentifier:(unsigned __int8)a3;
- (id)syndicationIngestMutexStateDescription;
- (id)tryUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3;
- (void)stopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3;
@end

@implementation PLSyndicationIngestMutex

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIngestLibraryUsageStart, 0);
  objc_storeStrong((id *)&self->_syndicationIngestLibrary, 0);
  objc_destroyWeak((id *)&self->_databaseContext);
}

- (void)stopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  if (!v3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLSyndicationIngestMutex.m", 188, @"Invalid parameter not satisfying: %@", @"identifier != PLSyndicationIngestClientIdentifierNone" object file lineNumber description];
  }
  if (self->_syndicationIngestClientIdentifier != v3)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSyndicationIngestMutex.m", 189, @"Invalid parameter not satisfying: %@", @"_syndicationIngestClientIdentifier == identifier" object file lineNumber description];
  }
  syndicationIngestLibrary = self->_syndicationIngestLibrary;
  if (!syndicationIngestLibrary)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSyndicationIngestMutex.m", 190, @"Invalid parameter not satisfying: %@", @"_syndicationIngestLibrary != nil" object file lineNumber description];

    syndicationIngestLibrary = self->_syndicationIngestLibrary;
  }
  self->_syndicationIngestClientIdentifier = 0;
  v8 = [(PLPhotoLibrary *)syndicationIngestLibrary name];
  v9 = self->_syndicationIngestLibrary;
  self->_syndicationIngestLibrary = 0;

  [(NSDate *)self->_syndicationIngestLibraryUsageStart timeIntervalSinceNow];
  double v11 = v10;
  syndicationIngestLibraryUsageStart = self->_syndicationIngestLibraryUsageStart;
  self->_syndicationIngestLibraryUsageStart = 0;

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
  v13 = PLSyndicationGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = PLSyndicationIngestClientStringFromIdentifier(v3);
    *(_DWORD *)buf = 138412802;
    v19 = v14;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2048;
    double v23 = 0.0 - v11;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "(MUTEX) %@ stopped using syndication ingest library %@ after %f sec", buf, 0x20u);
  }
}

- (BOOL)shouldStopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  unsigned int syndicationIngestClientIdentifier = self->_syndicationIngestClientIdentifier;
  if (syndicationIngestClientIdentifier == v3)
  {
    unsigned int requestedSyndicationIngestClientIdentifier = self->_requestedSyndicationIngestClientIdentifier;
    os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
    if (requestedSyndicationIngestClientIdentifier <= v3) {
      return 0;
    }
    v8 = &stru_1EEB2EB80;
  }
  else
  {
    os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
    v9 = NSString;
    double v10 = PLSyndicationIngestClientStringFromIdentifier(syndicationIngestClientIdentifier);
    v8 = [v9 stringWithFormat:@" (current owner is %@)", v10];
  }
  double v11 = PLSyndicationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = PLSyndicationIngestClientStringFromIdentifier(v3);
    *(_DWORD *)buf = 138412546;
    v15 = v12;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "(MUTEX) %@ should stop using syndication ingest library%{public}@", buf, 0x16u);
  }
  return 1;
}

- (id)tryUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!PLSyndicationRuntimeEnabled())
  {
    __int16 v22 = PLSyndicationGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "(MUTEX) Syndication runtime is disabled via internal user defaults", buf, 2u);
    }

    v6 = 0;
    goto LABEL_22;
  }
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  v6 = [(PLSyndicationIngestMutex *)self _obtainSyndicationIngestLibraryIfPossibleWithIdentifier:v3];
  if (v6 || self->_syndicationIngestClientIdentifier >= v3)
  {
LABEL_21:
    os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
    goto LABEL_22;
  }
  syndicationIngestLibrary = self->_syndicationIngestLibrary;
  if (!syndicationIngestLibrary)
  {
    double v23 = PLSyndicationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "(MUTEX) could not get a library and it's not already in use. Probably shutting down.", buf, 2u);
    }

    goto LABEL_21;
  }
  self->_unsigned int requestedSyndicationIngestClientIdentifier = v3;
  p_super = syndicationIngestLibrary;
  os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
  useconds_t v9 = 10000;
  *(void *)&long long v10 = 138412290;
  long long v27 = v10;
  while (1)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v27);
    v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = PLSyndicationIngestClientStringFromIdentifier(v3);
      *(_DWORD *)buf = v27;
      v29 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "(MUTEX) %@ Waiting for syndication ingest mutex", buf, 0xCu);
    }
    [p_super performBlockAndWait:&__block_literal_global_105048];
    [v11 timeIntervalSinceNow];
    double v15 = v14;
    __int16 v16 = PLSyndicationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = PLSyndicationIngestClientStringFromIdentifier(v3);
      *(_DWORD *)buf = 138412546;
      v29 = v17;
      __int16 v30 = 2048;
      double v31 = 0.0 - v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "(MUTEX) %@ Done waiting for syndication ingest mutex. Blocked for %f sec", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
    uint64_t v18 = [(PLSyndicationIngestMutex *)self _obtainSyndicationIngestLibraryIfPossibleWithIdentifier:v3];
    if (v18) {
      break;
    }
    v19 = self->_syndicationIngestLibrary;

    if (!v19)
    {
      p_super = PLSyndicationGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, "(MUTEX) Unable to obtain syndication ingest library mutex and there's no blocking library", buf, 2u);
      }
      v6 = 0;
      goto LABEL_31;
    }
    os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
    __int16 v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = PLSyndicationIngestClientStringFromIdentifier(v3);
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      __int16 v30 = 1024;
      LODWORD(v31) = v9;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "(MUTEX) %@ did not get the syndication ingest mutex, retrying after %u usec...", buf, 0x12u);
    }
    usleep(v9);
    v9 <<= v9 < 0x989680;

    p_super = &v19->super;
  }
  v6 = (void *)v18;
  v25 = PLSyndicationGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = PLSyndicationIngestClientStringFromIdentifier(v3);
    *(_DWORD *)buf = v27;
    v29 = v26;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "(MUTEX) %@ Acquired the syndication ingest mutex", buf, 0xCu);
  }
LABEL_31:

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
LABEL_22:
  return v6;
}

- (id)_obtainSyndicationIngestLibraryIfPossibleWithIdentifier:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  os_unfair_lock_assert_owner(&self->_syndicationIngestLibraryLock);
  if (self->_syndicationIngestClientIdentifier == v3)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLSyndicationIngestMutex.m", 76, @"Invalid parameter not satisfying: %@", @"_syndicationIngestClientIdentifier != identifier" object file lineNumber description];
  }
  if (self->_syndicationIngestLibrary || self->_requestedSyndicationIngestClientIdentifier > v3)
  {
    v6 = 0;
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseContext);
  useconds_t v9 = WeakRetained;
  if (!WeakRetained)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSyndicationIngestMutex.m", 93, @"Invalid parameter not satisfying: %@", @"databaseContext" object file lineNumber description];

LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = [WeakRetained wellKnownPhotoLibraryIdentifier];
  objc_msgSend(NSString, "stringWithFormat:", @"PLSharingIngestLibrary(%tu)-%hhu", v10, v3);
  id v11 = objc_claimAutoreleasedReturnValue();
  v12 = (PLPhotoLibrary *)objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v11, "UTF8String"));
  syndicationIngestLibrary = self->_syndicationIngestLibrary;
  self->_syndicationIngestLibrary = v12;

  double v14 = self->_syndicationIngestLibrary;
  if (!v14)
  {
    uint64_t v18 = PLSyndicationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "(MUTEX) did not obtain library from database context. Probably shutting down.", buf, 2u);
    }

    goto LABEL_16;
  }
  self->_unsigned int syndicationIngestClientIdentifier = v3;
  self->_unsigned int requestedSyndicationIngestClientIdentifier = 0;
  v6 = v14;
  double v15 = [MEMORY[0x1E4F1C9C8] now];
  syndicationIngestLibraryUsageStart = self->_syndicationIngestLibraryUsageStart;
  self->_syndicationIngestLibraryUsageStart = v15;

LABEL_17:
LABEL_6:
  return v6;
}

- (id)syndicationIngestMutexStateDescription
{
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  [(NSDate *)self->_syndicationIngestLibraryUsageStart timeIntervalSinceNow];
  double v5 = 0.0 - v4;
  int requestedSyndicationIngestClientIdentifier = self->_requestedSyndicationIngestClientIdentifier;
  v7 = NSString;
  uint64_t v8 = PLSyndicationIngestClientStringFromIdentifier(self->_syndicationIngestClientIdentifier);
  useconds_t v9 = (void *)v8;
  if (requestedSyndicationIngestClientIdentifier)
  {
    uint64_t v10 = PLSyndicationIngestClientStringFromIdentifier(self->_requestedSyndicationIngestClientIdentifier);
    id v11 = [v7 stringWithFormat:@"Active: %@ (%f sec), Waiting: %@", v9, *(void *)&v5, v10];
  }
  else
  {
    id v11 = [v7 stringWithFormat:@"Active: %@ (%f sec), No contention", v8, *(void *)&v5];
  }

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
  return v11;
}

- (PLSyndicationIngestMutex)initWithDatabaseContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSyndicationIngestMutex;
  double v5 = [(PLSyndicationIngestMutex *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_databaseContext, v4);
    syndicationIngestLibrary = v6->_syndicationIngestLibrary;
    v6->_syndicationIngestLibrary = 0;

    v6->_syndicationIngestLibraryLock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v6->_unsigned int syndicationIngestClientIdentifier = 0;
  }

  return v6;
}

@end