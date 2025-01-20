@interface NSError
+ (BOOL)ioErrorWithDomain:(id)a3 code:(int)a4 error:(id *)a5;
@end

@implementation NSError

+ (BOOL)ioErrorWithDomain:(id)a3 code:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (a5)
  {
    if (v6)
    {
      v15[0] = &off_E238;
      v15[1] = &off_E250;
      v16[0] = @"success";
      v16[1] = @"general error";
      v15[2] = &off_E268;
      v15[3] = &off_E280;
      v16[2] = @"memory allocation error";
      v16[3] = @"resource shortage";
      v15[4] = &off_E298;
      v15[5] = &off_E2B0;
      v16[4] = @"Mach IPC failure";
      v16[5] = @"no such device";
      v15[6] = &off_E2C8;
      v15[7] = &off_E2E0;
      v16[6] = @"privilege violation";
      v16[7] = @"invalid argument";
      v15[8] = &off_E2F8;
      v15[9] = &off_E310;
      v16[8] = @"device is read locked";
      v16[9] = @"device is write locked";
      v15[10] = &off_E328;
      v15[11] = &off_E340;
      v16[10] = @"device is exclusive access";
      v16[11] = @"bad IPC message ID";
      v15[12] = &off_E358;
      v15[13] = &off_E370;
      v16[12] = @"unsupported function";
      v16[13] = @"virtual memory error";
      v15[14] = &off_E388;
      v15[15] = &off_E3A0;
      v16[14] = @"internal driver error";
      v16[15] = @"I/O error";
      v15[16] = &off_E3B8;
      v15[17] = &off_E3D0;
      v16[16] = @"cannot acquire lock";
      v16[17] = @"device is not open";
      v15[18] = &off_E3E8;
      v15[19] = &off_E400;
      v16[18] = @"device is not readable";
      v16[19] = @"device is not writeable";
      v15[20] = &off_E418;
      v15[21] = &off_E430;
      v16[20] = @"alignment error";
      v16[21] = @"media error";
      v15[22] = &off_E448;
      v15[23] = &off_E460;
      v16[22] = @"device is still open";
      v16[23] = @"rld failure";
      v15[24] = &off_E478;
      v15[25] = &off_E490;
      v16[24] = @"DMA failure";
      v16[25] = @"device is busy";
      v15[26] = &off_E4A8;
      v15[27] = &off_E4C0;
      v16[26] = @"I/O timeout";
      v16[27] = @"device is offline";
      v15[28] = &off_E4D8;
      v15[29] = &off_E4F0;
      v16[28] = @"device is not ready";
      v16[29] = @"device/channel is not attached";
      v15[30] = &off_E508;
      v15[31] = &off_E520;
      v16[30] = @"no DMA channels available";
      v16[31] = @"no space for data";
      v15[32] = &off_E538;
      v15[33] = &off_E550;
      v16[32] = @"device port already exists";
      v16[33] = @"cannot wire physical memory";
      v15[34] = &off_E568;
      v15[35] = &off_E580;
      v16[34] = @"no interrupt attached";
      v16[35] = @"no DMA frames enqueued";
      v15[36] = &off_E598;
      v15[37] = &off_E5B0;
      v16[36] = @"message is too large";
      v16[37] = @"operation is not permitted";
      v15[38] = &off_E5C8;
      v15[39] = &off_E5E0;
      v16[38] = @"device is without power";
      v16[39] = @"media is not present";
      v15[40] = &off_E5F8;
      v15[41] = &off_E610;
      v16[40] = @"media is not formatted";
      v16[41] = @"unsupported mode";
      v15[42] = &off_E628;
      v15[43] = &off_E640;
      v16[42] = @"data underrun";
      v16[43] = @"data overrun";
      v15[44] = &off_E658;
      v15[45] = &off_E670;
      v16[44] = @"device error";
      v16[45] = @"no completion routine";
      v15[46] = &off_E688;
      v15[47] = &off_E6A0;
      v16[46] = @"operation was aborted";
      v16[47] = @"bus bandwidth would be exceeded";
      v15[48] = &off_E6B8;
      v15[49] = &off_E6D0;
      v16[48] = @"device is not responding";
      v16[49] = @"unanticipated driver error";
      v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:50];
      v9 = +[NSNumber numberWithInt:v6];
      v10 = [v8 objectForKeyedSubscript:v9];

      if (!v10)
      {
        v10 = +[NSString stringWithFormat:@"0x%x (UNDEFINED)", v6];
      }
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      v14 = v10;
      v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a5 = +[NSError errorWithDomain:v7 code:(int)v6 userInfo:v11];
    }
    else
    {
      *a5 = 0;
    }
  }

  return v6 == 0;
}

@end