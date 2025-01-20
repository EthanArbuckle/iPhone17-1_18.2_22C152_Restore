@interface VideoPlaybackStream
- (LocalizerInputEvent)readNextEvent;
- (VideoPlaybackStream)initWithDatarun:(const void *)a3;
- (duration<long)getTimeStampFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (opaqueCMSampleBuffer)readNextSampleBuffer;
- (void)dealloc;
@end

@implementation VideoPlaybackStream

- (VideoPlaybackStream)initWithDatarun:(const void *)a3
{
  v29.receiver = self;
  v29.super_class = (Class)VideoPlaybackStream;
  v4 = [(VideoPlaybackStream *)&v29 init];
  if (!v4)
  {
    v5 = 0;
    goto LABEL_23;
  }
  v4->_datarunStart.__rep_ = sub_1000E02D8((uint64_t)a3);
  v4->_source = 0;
  char v32 = 8;
  strcpy((char *)v31, "back.mp4");
  if (*((char *)a3 + 23) < 0) {
    sub_1000559FC(&__p, *(void **)a3, *((void *)a3 + 1));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  sub_1000512AC(&__p, (uint64_t)v31);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v7 = +[NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((v32 & 0x80000000) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    operator delete(v31[0]);
    goto LABEL_11;
  }
  if (v32 < 0) {
    goto LABEL_17;
  }
LABEL_11:
  v8 = +[NSURL fileURLWithPath:v7];
  v9 = +[NSDictionary dictionary];
  v10 = [(objc_class *)off_10047D0C0() URLAssetWithURL:v8 options:v9];
  v11 = off_10047D0D0();
  v12 = [v10 tracksWithMediaType:v11];

  if ([v12 count] == (id)1)
  {
    uint64_t v13 = [v12 objectAtIndex:0];
    track = v4->_track;
    v4->_track = (AVAssetTrack *)v13;

    v15 = +[NSNumber numberWithUnsignedInteger:1111970369];
    v16 = +[NSDictionary dictionaryWithObject:v15 forKey:off_10047D120()];

    uint64_t v17 = [(objc_class *)off_10047D0C8() assetReaderTrackOutputWithTrack:v4->_track outputSettings:v16];
    readerTrackOutput = v4->_readerTrackOutput;
    v4->_readerTrackOutput = (AVAssetReaderTrackOutput *)v17;

    id v28 = 0;
    uint64_t v19 = [(objc_class *)off_10047D0B8() assetReaderWithAsset:v10 error:&v28];
    id v20 = v28;
    p_reader = &v4->_reader;
    reader = v4->_reader;
    v4->_reader = (AVAssetReader *)v19;

    v23 = v4->_reader;
    v27 = @"Failed to open reader for ";
    v26 = (const std::string::value_type *)[v7 UTF8String];
    if (v20)
    {
      p_reader = [v20 description];
      v25 = (const std::string::value_type *)[p_reader UTF8String];
      if (!v23)
      {
LABEL_24:
        sub_1000AE4B0(v31, "");
        sub_100315A34((uint64_t)&v27, &__p);
        sub_100315E10(&v26, &v34);
        sub_10026F608(": ", &v35);
        sub_100315E10(&v25, &v36);
        sub_10016A2C4((uint64_t)v31, (uint64_t)&__p, 4);
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v36.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_26:
            if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_27;
            }
            goto LABEL_32;
          }
        }
        else if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_26;
        }
        operator delete(v35.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_27:
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_28;
          }
          goto LABEL_33;
        }
LABEL_32:
        operator delete(v34.__r_.__value_.__l.__data_);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_28:
          if ((v32 & 0x80000000) == 0) {
            goto LABEL_29;
          }
LABEL_34:
          operator delete(v31[0]);
LABEL_29:
          sub_1000D11E0((uint64_t)&v30);
        }
LABEL_33:
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((v32 & 0x80000000) == 0) {
          goto LABEL_29;
        }
        goto LABEL_34;
      }
    }
    else
    {
      v25 = "<nil error>";
      if (!v23) {
        goto LABEL_24;
      }
    }
    if (v20) {

    }
    [(AVAssetReader *)v4->_reader addOutput:v4->_readerTrackOutput];
    [(AVAssetReader *)v4->_reader startReading];
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

LABEL_23:
  return v5;
}

- (void)dealloc
{
  [(AVAssetReader *)self->_reader cancelReading];
  v3.receiver = self;
  v3.super_class = (Class)VideoPlaybackStream;
  [(VideoPlaybackStream *)&v3 dealloc];
}

- (LocalizerInputEvent)readNextEvent
{
  v4 = v2;
  v5 = [(VideoPlaybackStream *)self readNextSampleBuffer];
  if (v5)
  {
    uint64_t v7 = (uint64_t)v5;
    v8.__rep_ = (int64_t)[(VideoPlaybackStream *)self getTimeStampFromSampleBuffer:v5];
    v9 = (const void *)sub_10036405C(v7);
    unsigned __int8 source = self->_source;
    v5 = (opaqueCMSampleBuffer *)operator new(0x108uLL);
    v11 = v5;
    *((void *)v5 + 1) = 0;
    *((void *)v5 + 2) = 0;
    *(void *)v5 = off_100454870;
    *((duration<long long, std::ratio<1, 1000000000>> *)v5 + 4) = v8;
    *((unsigned char *)v5 + 40) = source;
    if (v9)
    {
      *((void *)v5 + 6) = CFRetain(v9);
      *((_DWORD *)v11 + 6) = 13;
      void *v4 = (char *)v11 + 24;
      v4[1] = v11;
      CFRelease(v9);
    }
    else
    {
      *((void *)v5 + 6) = 0;
      *((_DWORD *)v5 + 6) = 13;
      void *v4 = (char *)v5 + 24;
      v4[1] = v5;
    }
  }
  else
  {
    uint64_t v12 = qword_100492A88;
    void *v4 = qword_100492A80;
    v4[1] = v12;
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
  }
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- (opaqueCMSampleBuffer)readNextSampleBuffer
{
  reader = self->_reader;
  if (!reader || (id)[(AVAssetReader *)reader status] != (id)1) {
    return 0;
  }
  readerTrackOutput = self->_readerTrackOutput;

  return (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)readerTrackOutput copyNextSampleBuffer];
}

- (duration<long)getTimeStampFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  sub_100364014((uint64_t)a3);
  sub_100364020((uint64_t)v6);
  return (duration<long long, std::ratio<1, 1000000000>>)(self->_datarunStart.__rep_ + (uint64_t)(v4 * 1000000000.0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_readerTrackOutput, 0);

  objc_storeStrong((id *)&self->_track, 0);
}

@end