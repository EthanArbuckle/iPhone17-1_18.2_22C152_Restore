@interface UMDAPFSSupportVolumeHelper
- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8;
- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4;
- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4;
- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6;
- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6;
@end

@implementation UMDAPFSSupportVolumeHelper

- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8
{
  return sub_10007C588((__CFDictionary *)a3, a4, (const __CFString *)a5, a6, a7, a8) != 0;
}

- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4
{
  return sub_10007D0FC((const __CFDictionary *)a3, a4) != 0;
}

- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6
{
  return sub_10007D844((const __CFDictionary *)a3, (const __CFString *)a4, a5, a6) != 0;
}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6
{
  if (a6) {
    int v7 = 0x80000;
  }
  else {
    int v7 = 0;
  }
  return sub_10007F0F4((const __CFDictionary *)a3, (const __CFString *)a4, a5, v7) != 0;
}

- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4
{
  return sub_10007EB50((const __CFDictionary *)a3, a4) != 0;
}

@end