@interface FTCaptionsMachine
+ (double)machTimeScale;
+ (double)mediaTimeBase;
+ (int)createWebVTTTextSampleBuffer:(__CFString *)a3 startTime:(id *)a4 duration:(id *)a5 sampleBufferOut:(opaqueCMSampleBuffer *)a6;
@end

@implementation FTCaptionsMachine

+ (double)machTimeScale
{
  if (qword_10005A9D0 != -1) {
    dispatch_once(&qword_10005A9D0, &stru_100051358);
  }
  return *(double *)&qword_10005A9D8;
}

+ (double)mediaTimeBase
{
  [a1 machTimeScale];
  return v2 * (double)(uint64_t)mach_absolute_time();
}

+ (int)createWebVTTTextSampleBuffer:(__CFString *)a3 startTime:(id *)a4 duration:(id *)a5 sampleBufferOut:(opaqueCMSampleBuffer *)a6
{
  CMFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v30 = 0;
  CMFormatDescriptionCreate(kCFAllocatorDefault, 0x74657874u, 0x77767474u, 0, &formatDescriptionOut);
  sampleTimingArray.duration = (CMTime)*a5;
  sampleTimingArray.presentationTimeStamp = (CMTime)*a4;
  sampleTimingArray.decodeTimeStamp = kCMTimeInvalid;
  CMBlockBufferRef blockBufferOut = 0;
  size_t sampleSizeArray = 0;
  if (a3)
  {
    CFIndex Length = CFStringGetLength(a3);
    *(void *)time = 0;
    v32.location = 0;
    v32.length = Length;
    CFStringGetBytes(a3, v32, 0x8000100u, 0, 0, 0, 0, (CFIndex *)time);
    v11 = (UInt8 *)malloc_type_malloc(*(size_t *)time, 0x8F6B2BC3uLL);
    v33.location = 0;
    v33.length = Length;
    CFStringGetBytes(a3, v33, 0x8000100u, 0, 0, v11, *(CFIndex *)time, (CFIndex *)time);
    size_t v12 = *(unsigned int *)time + 16;
    unsigned int v13 = bswap32(*(_DWORD *)time + 16);
    unsigned int v14 = bswap32(*(_DWORD *)time + 8);
    v15 = malloc_type_malloc(v12, 0x25C3BFB5uLL);
    _DWORD *v15 = v13;
    v15[1] = 1668576374;
    v15[2] = v14;
    v15[3] = 1819894128;
    memcpy(v15 + 4, v11, *(size_t *)time);
  }
  else
  {
    size_t v12 = 8;
    v15 = malloc_type_malloc(8uLL, 0x8A413F40uLL);
    v11 = 0;
    *(void *)v15 = 0x6574747608000000;
  }
  OSStatus v16 = CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, v15, v12, kCFAllocatorDefault, 0, 0, v12, 0, &blockBufferOut);
  if (v16)
  {
    OSStatus v17 = v16;
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    CFStringRef v18 = CMTimeCopyDescription(kCFAllocatorDefault, (CMTime *)time);
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    CFStringRef v19 = CMTimeCopyDescription(kCFAllocatorDefault, (CMTime *)time);
    v20 = FTDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)time = 67109634;
      *(_DWORD *)&time[4] = v17;
      *(_WORD *)&time[8] = 2112;
      *(void *)&time[10] = v18;
      *(_WORD *)&time[18] = 2112;
      *(void *)&time[20] = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error %d creating buffer with memory block start time %@ duration %@", time, 0x1Cu);
    }

    CFRelease(v18);
    CMSampleBufferRef v21 = (CMSampleBufferRef)v19;
LABEL_8:
    CFRelease(v21);
    goto LABEL_9;
  }
  size_t sampleSizeArray = v12;
  OSStatus v17 = CMSampleBufferCreate(kCFAllocatorDefault, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v30);
  if (v17)
  {
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    CFStringRef v23 = CMTimeCopyDescription(kCFAllocatorDefault, (CMTime *)time);
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    CFStringRef v24 = CMTimeCopyDescription(kCFAllocatorDefault, (CMTime *)time);
    v25 = FTDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)time = 67109634;
      *(_DWORD *)&time[4] = v17;
      *(_WORD *)&time[8] = 2112;
      *(void *)&time[10] = v23;
      *(_WORD *)&time[18] = 2112;
      *(void *)&time[20] = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error %d creating buffer with memory block start time %@ duration %@", time, 0x1Cu);
    }

    CFRelease(v23);
    CFRelease(v24);
    CMSampleBufferRef v21 = v30;
    if (v30) {
      goto LABEL_8;
    }
  }
  else
  {
    *a6 = v30;
    CMSampleBufferRef v30 = 0;
  }
LABEL_9:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  free(v11);
  return v17;
}

@end