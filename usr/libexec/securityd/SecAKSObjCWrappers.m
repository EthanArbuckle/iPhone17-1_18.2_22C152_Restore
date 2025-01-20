@interface SecAKSObjCWrappers
+ (BOOL)aksDecryptWithKeybag:(int)a3 keyclass:(int)a4 ciphertext:(id)a5 outKeyclass:(int *)a6 plaintext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10;
+ (BOOL)aksEncryptWithKeybag:(int)a3 keyclass:(int)a4 plaintext:(id)a5 outKeyclass:(int *)a6 ciphertext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10;
@end

@implementation SecAKSObjCWrappers

+ (BOOL)aksDecryptWithKeybag:(int)a3 keyclass:(int)a4 ciphertext:(id)a5 outKeyclass:(int *)a6 plaintext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10
{
  v13 = *(const void **)&a4;
  uint64_t v14 = *(void *)&a3;
  id v15 = a5;
  v16 = (__CFData *)a7;
  id v24 = 0;
  unsigned int v17 = [v15 length];
  id v18 = v15;
  id v19 = [v18 bytes];
  if (a8) {
    char v20 = sub_100154158(@"od", v14, v13, v17, (uint64_t)v19, a6, v16, (uint64_t)a8, a9, (__CFString **)&v24);
  }
  else {
    char v20 = sub_100014458(@"od", v14, 0, (uint64_t)v13, v17, v19, a6, v16, 0, (__CFString **)&v24);
  }
  BOOL v21 = v20;
  id v22 = v24;
  if (a10)
  {
    *a10 = v24;
  }
  else if (v24)
  {
    id v24 = 0;
    CFRelease(v22);
  }

  return v21;
}

+ (BOOL)aksEncryptWithKeybag:(int)a3 keyclass:(int)a4 plaintext:(id)a5 outKeyclass:(int *)a6 ciphertext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10
{
  v13 = *(const void **)&a4;
  uint64_t v14 = *(void *)&a3;
  id v15 = a5;
  v16 = (__CFData *)a7;
  id v24 = 0;
  unsigned int v17 = [v15 length];
  id v18 = v15;
  id v19 = [v18 bytes];
  if (a8) {
    char v20 = sub_100154158(@"oe", v14, v13, v17, (uint64_t)v19, a6, v16, (uint64_t)a8, a9, (__CFString **)&v24);
  }
  else {
    char v20 = sub_100014458(@"oe", v14, 0, (uint64_t)v13, v17, v19, a6, v16, 0, (__CFString **)&v24);
  }
  BOOL v21 = v20;
  id v22 = v24;
  if (a10)
  {
    *a10 = v24;
  }
  else if (v24)
  {
    id v24 = 0;
    CFRelease(v22);
  }

  return v21;
}

@end