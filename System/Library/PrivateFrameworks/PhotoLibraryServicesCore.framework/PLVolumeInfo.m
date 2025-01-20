@interface PLVolumeInfo
- (PLVolumeInfo)initWithMountPoint:(id)a3;
- (PLVolumeInfo)initWithPath:(id)a3;
- (int64_t)availableSpace;
- (unint64_t)desiredDiskThreshold;
- (unint64_t)lowDiskThreshold;
- (unint64_t)nearLowDiskThreshold;
- (unint64_t)veryLowDiskThreshold;
- (unint64_t)volumeSize;
@end

@implementation PLVolumeInfo

- (void).cxx_destruct
{
}

- (unint64_t)volumeSize
{
  return self->_volumeSize;
}

- (unint64_t)veryLowDiskThreshold
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_veryLowDiskThreshold;
  if (!result)
  {
    unsigned int v8 = 0;
    if (fsctl([(NSString *)self->_mountPoint fileSystemRepresentation], 0x4004681BuLL, &v8, 0))
    {
      v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        unint64_t volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        __int16 v11 = 2048;
        uint64_t v12 = 524288000;
        __int16 v13 = 2048;
        unint64_t v14 = volumeSize;
        _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED very low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      unint64_t result = 524288000;
    }
    else
    {
      unint64_t result = self->_blockSize * v8;
    }
    self->_veryLowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)lowDiskThreshold
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_lowDiskThreshold;
  if (!result)
  {
    unsigned int v8 = 0;
    if (fsctl([(NSString *)self->_mountPoint fileSystemRepresentation], 0x4004681CuLL, &v8, 0))
    {
      v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        unint64_t volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        __int16 v11 = 2048;
        uint64_t v12 = 734003200;
        __int16 v13 = 2048;
        unint64_t v14 = volumeSize;
        _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      unint64_t result = 734003200;
    }
    else
    {
      unint64_t result = self->_blockSize * v8;
    }
    self->_lowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)nearLowDiskThreshold
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_nearLowDiskThreshold;
  if (!result)
  {
    unsigned int v8 = 0;
    if (fsctl([(NSString *)self->_mountPoint fileSystemRepresentation], 0x40044A12uLL, &v8, 0))
    {
      v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        unint64_t volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        __int16 v11 = 2048;
        uint64_t v12 = 0x40000000;
        __int16 v13 = 2048;
        unint64_t v14 = volumeSize;
        _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED near low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      unint64_t result = 0x40000000;
    }
    else
    {
      unint64_t result = self->_blockSize * v8;
    }
    self->_nearLowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)desiredDiskThreshold
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_desiredDiskThreshold;
  if (!result)
  {
    unsigned int v8 = 0;
    if (fsctl([(NSString *)self->_mountPoint fileSystemRepresentation], 0x4004681DuLL, &v8, 0))
    {
      v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        unint64_t volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        __int16 v11 = 2048;
        uint64_t v12 = 1283457024;
        __int16 v13 = 2048;
        unint64_t v14 = volumeSize;
        _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED desired threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      unint64_t result = 1283457024;
    }
    else
    {
      unint64_t result = self->_blockSize * v8;
    }
    self->_desiredDiskThreshold = result;
  }
  return result;
}

- (int64_t)availableSpace
{
  return +[PLDiskController diskSpaceAvailableForPath:self->_mountPoint];
}

- (PLVolumeInfo)initWithMountPoint:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLVolumeInfo *)self init];
  if (v5)
  {
    if (v4)
    {
      bzero(&v16, 0x878uLL);
      id v6 = v4;
      if (!statfs((const char *)[v6 fileSystemRepresentation], &v16))
      {
        uint64_t f_bsize = v16.f_bsize;
        v5->_blockSize = v16.f_bsize;
        v5->_unint64_t volumeSize = v16.f_blocks * f_bsize;
        objc_storeStrong((id *)&v5->_mountPoint, v6);
        goto LABEL_9;
      }
      v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unsigned int v8 = __error();
        v9 = strerror(*v8);
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2080;
        uint64_t v15 = v9;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "unable to stat volume %@: %s", (uint8_t *)&v12, 0x16u);
      }
    }
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (PLVolumeInfo)initWithPath:(id)a3
{
  id v4 = +[PLDiskController mountPointForPath:a3];
  v5 = [(PLVolumeInfo *)self initWithMountPoint:v4];

  return v5;
}

@end