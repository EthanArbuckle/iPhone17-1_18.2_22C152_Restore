unsigned char *MBDIMCreateDictionaryFromCSSString(void *a1, char a2)
{
  id v2;
  id v3;
  char *v4;
  char *v5;
  unsigned char *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned char *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  unsigned char *v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  void *v29;

  v2 = a1;
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (char *)[v2 lengthOfBytesUsingEncoding:4];
    if (v4)
    {
      v5 = v4 + 1;
      v6 = malloc_type_malloc((size_t)(v4 + 1), 0xBAB9D742uLL);
      if (!v6) {
        goto LABEL_40;
      }
      if ([v2 getCString:v6 maxLength:v5 encoding:4])
      {
        v7 = 0;
        v8 = 0;
        v29 = v6;
        while (1)
        {
          v9 = *v6;
          if (!*v6) {
            goto LABEL_12;
          }
          v10 = v6;
          if (v9 <= 0x39) {
            goto LABEL_44;
          }
          if (v9 == 58)
          {
            v11 = 0;
            v10 = v6 + 1;
            v12 = v8;
            v8 = v7;
            goto LABEL_31;
          }
          v10 = v6;
          if (v9 >= 0x3C)
          {
LABEL_44:
            do
              v14 = *++v10;
            while (byte_100037B90[v14] < 0);
            v15 = (unint64_t)(v10 - 1);
            v16 = v6;
            if (v6 < v10)
            {
              while (1)
              {
                v17 = *v6;
                v18 = v17 > 0x27;
                v19 = (1 << v17) & 0x8500002600;
                if (v18 || v19 == 0) {
                  break;
                }
                v16 = v6 + 1;
                if ((unint64_t)v6++ >= v15) {
                  goto LABEL_23;
                }
              }
              v16 = v6;
            }
LABEL_23:
            v22 = (unint64_t)v10;
            if (v15 > (unint64_t)v16)
            {
              v23 = (unint64_t)v10;
              v22 = (unint64_t)v10;
              while (1)
              {
                v24 = *(unsigned __int8 *)--v22;
                v25 = (1 << v24) & 0x8500002600;
                if (v24 > 0x27 || v25 == 0) {
                  break;
                }
                v23 = v22;
                if (v22 <= (unint64_t)(v16 + 1)) {
                  goto LABEL_30;
                }
              }
              v22 = v23;
            }
LABEL_30:
            v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v16, v22 - (void)v16, 4, v29);
            v12 = v7;
LABEL_31:

            v7 = v11;
            v6 = v10;
          }
          else
          {
LABEL_12:
            if (v8 && v7)
            {
              if (a2)
              {
                v13 = [v8 lowercaseString];
                [v3 setObject:v7 forKey:v13];
              }
              else
              {
                [v3 setObject:v7 forKey:v8];
              }
            }

            v7 = 0;
            v8 = 0;
            if (!*v6++)
            {
              free(v29);
              v6 = v3;
              goto LABEL_40;
            }
          }
        }
      }
      free(v6);
    }
    v6 = 0;
LABEL_40:
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id MBDIMCopyNormalizedAttributes(void *a1, int a2, int a3)
{
  id v5 = a1;
  v6 = v5;
  if (a2 & 1) != 0 || (a3)
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v6 keyEnumerator];
    id v8 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v6 objectForKey:v12];
          if (a2)
          {
            uint64_t v14 = [v12 lowercaseString];

            id v12 = (id)v14;
          }
          if (a3)
          {
            uint64_t v15 = [v13 lowercaseString];

            v13 = (void *)v15;
          }
          [v7 setObject:v13 forKey:v12];
        }
        id v9 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = [v5 copy];
  }

  return v7;
}

id SMSCopySanitizedContentLocation(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"cid:"])
  {
    id v2 = [v1 mutableCopy];
    [v2 replaceOccurrencesOfString:@"cid:", &stru_10003EA60, 2, 0, objc_msgSend(@"cid:", "length") withString options range];
  }
  else
  {
    id v2 = v1;
  }

  return v2;
}

double transcriptWaveformWidthForDuration(double a1)
{
  if (a1 >= 20.0) {
    return 150.0;
  }
  double v1 = log2(a1 + 1.0) * 50.0 / 4.39231742;
  unint64_t v2 = 75;
  if ((unint64_t)v1 >= 0x19) {
    return (double)(3 * (unint64_t)v1);
  }
  return (double)v2;
}

unint64_t powerLevelsCountForWidth(double a1)
{
  return (unint64_t)(a1 / 3.0);
}

AudioMetadata *audioMetadataForFileURL(void *a1)
{
  CFURLRef v64 = a1;
  v63 = objc_alloc_init(AudioMetadata);
  id v62 = 0;
  id v61 = 0;
  ExtAudioFileRef outExtAudioFile = 0;
  memset(&__b, 0, sizeof(__b));
  v60 = malloc_type_malloc(0x8000uLL, 0x9ABEB6B3uLL);
  if (v60)
  {
    if (v64)
    {
      ExtAudioFileOpenURL(v64, &outExtAudioFile);
      if (outExtAudioFile)
      {
        AudioFileID outPropertyData = 0;
        UInt32 ioPropertyDataSize = 8;
        OSStatus Property = ExtAudioFileGetProperty(outExtAudioFile, 0x6166696Cu, &ioPropertyDataSize, &outPropertyData);
        if (Property)
        {
          v51 = sub_10000B718();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            sub_10000B788(Property);
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            sub_10000B774((uint64_t)v90, (uint64_t)v50);
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Unable to get audioID: %@", v90, 0xCu);
          }
        }
        else
        {
          int v74 = 0;
          UInt32 ioDataSize = 4;
          AudioFileGetProperty(outPropertyData, 0x66666D74u, &ioDataSize, &v74);
          BOOL v49 = v74 == 1667327590;
          if (v74 == 1667327590)
          {
            double v72 = 0.0;
            UInt32 v71 = 8;
            OSStatus v53 = AudioFileGetProperty(outPropertyData, 0x65647572u, &v71, &v72);
            if (v53)
            {
              v47 = sub_10000B718();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                sub_10000B788(v53);
                id v46 = (id)objc_claimAutoreleasedReturnValue();
                sub_10000B774((uint64_t)v89, (uint64_t)v46);
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Unable to get duration: %@", v89, 0xCu);
              }
            }
            else
            {
              [(AudioMetadata *)v63 setDuration:v72];
              double v45 = transcriptWaveformWidthForDuration(v72);
              unint64_t v44 = powerLevelsCountForWidth(v45);
              if (v44 && v44 < 0x3E8)
              {
                id v61 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v44];

                if (v61)
                {
                  for (unint64_t i = 0; i < v44; ++i)
                  {
                    unint64_t v2 = +[NSNumber numberWithUnsignedInteger:0];
                    [v61 addObject:v2];
                  }
                  double v40 = v72 / (double)v44;
                  memset(v70, 0, sizeof(v70));
                  UInt32 v69 = 40;
                  OSStatus v3 = ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &v69, v70);
                  int v54 = v3;
                  if (v3)
                  {
                    v39 = sub_10000B718();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      sub_10000B788(v54);
                      id v38 = (id)objc_claimAutoreleasedReturnValue();
                      sub_10000B774((uint64_t)v87, (uint64_t)v38);
                      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unable to get sourceFormat: %@", v87, 0xCu);
                    }
                  }
                  else if (!v49 || LODWORD(v70[1]) == 1869641075)
                  {
                    memset(inPropertyData, 0, sizeof(inPropertyData));
                    if (v70[0] > 0.0 && v70[0] < 72000.0)
                    {
                      inPropertyData[0] = v70[0];
                      *(void *)&inPropertyData[1] = 0x96C70636DLL;
                      LODWORD(inPropertyData[4]) = 32;
                      *(void *)&inPropertyData[3] = 0x100000004;
                      *(void *)&inPropertyData[2] = 0x100000004;
                      OSStatus v55 = ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
                      if (v55)
                      {
                        v35 = sub_10000B718();
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          sub_10000B788(v55);
                          id v34 = (id)objc_claimAutoreleasedReturnValue();
                          sub_10000B774((uint64_t)v84, (uint64_t)v34);
                          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unable to set clientFormat: %@", v84, 0xCu);
                        }
                      }
                      else
                      {
                        double v33 = 0.0;
                        id v62 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v44];

                        if (v62)
                        {
                          for (unint64_t j = 0; j < v44; ++j)
                          {
                            v6 = +[NSNumber numberWithFloat:0.0];
                            [v62 addObject:v6];
                          }
                          do
                          {
                            __b.mNumberBuffers = 1;
                            __b.mBuffers[0].mNumberChannels = 1;
                            __b.mBuffers[0].mDataByteSize = 0x8000;
                            __b.mBuffers[0].mData = v60;
                            UInt32 ioNumberFrames = 0x2000;
                            OSStatus v56 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &__b);
                            if (!v56 && ioNumberFrames)
                            {
                              double v32 = (double)ioNumberFrames / inPropertyData[0];
                              mData = (float *)__b.mBuffers[0].mData;
                              UInt32 v27 = __b.mBuffers[0].mDataByteSize / LODWORD(inPropertyData[3]);
                              for (unsigned int k = 0; k < v27; ++k)
                              {
                                if ((float)(mData[k] * 32767.0) >= (float)0x7FFF) {
                                  float v7 = (float)0x7FFF;
                                }
                                else {
                                  float v7 = mData[k] * 32767.0;
                                }
                                if (v7 < (float)-32768) {
                                  float v7 = (float)-32768;
                                }
                                float v25 = v7;
                                if (v27 == 1) {
                                  double v24 = v33;
                                }
                                else {
                                  double v24 = v33 + (double)k / (double)(v27 - 1) * v32;
                                }
                                if (v24 / v40 >= (double)(v44 - 1)) {
                                  double v8 = (double)(v44 - 1);
                                }
                                else {
                                  double v8 = v24 / v40;
                                }
                                unint64_t v23 = (unint64_t)v8;
                                id v9 = [v62 objectAtIndex:(unint64_t)v8];
                                [v9 floatValue];
                                double v11 = pow(v10, 2.0);
                                id v12 = [v61 objectAtIndex:v23];
                                double v13 = (double)(unint64_t)[v12 unsignedIntegerValue];
                                long double v14 = pow(v25, 2.0) + v11 * v13;
                                uint64_t v15 = [v61 objectAtIndex:v23];
                                *(float *)&long double v14 = sqrt(v14/ (double)((unint64_t)[v15 unsignedIntegerValue]+ 1));

                                LODWORD(v16) = LODWORD(v14);
                                v17 = +[NSNumber numberWithFloat:v16];
                                [v62 setObject:v17 atIndexedSubscript:v23];

                                v18 = [v61 objectAtIndex:v23];
                                long long v19 = (char *)[v18 unsignedIntegerValue] + 1;

                                long long v20 = +[NSNumber numberWithUnsignedInteger:v19];
                                [v61 replaceObjectAtIndex:v23 withObject:v20];
                              }
                              double v33 = v33 + v32;
                              int v22 = 0;
                            }
                            else
                            {
                              oslog = sub_10000B718();
                              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                              {
                                sub_10000B788(v56);
                                id v28 = (id)objc_claimAutoreleasedReturnValue();
                                sub_10000B774((uint64_t)v83, (uint64_t)v28);
                                _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Unable to determine ioNumberFrames: %@", v83, 0xCu);
                              }
                              int v22 = 2;
                            }
                          }
                          while (!v22);
                        }
                        else
                        {
                          v31 = sub_10000B718();
                          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                          {
                            sub_10000B76C(v78);
                            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to allocate powerLevels", v78, 2u);
                          }
                        }
                      }
                    }
                    else
                    {
                      v36 = sub_10000B718();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      {
                        id v5 = +[NSNumber numberWithDouble:v70[0]];
                        sub_10000B774((uint64_t)v85, (uint64_t)v5);
                        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "mSampleRate is out of bounds: %@", v85, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    v37 = sub_10000B718();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                    {
                      v4 = +[NSNumber numberWithUnsignedInt:LODWORD(v70[1])];
                      sub_10000B774((uint64_t)v86, (uint64_t)v4);
                      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Format is not OPUS: %@", v86, 0xCu);
                    }
                  }
                }
                else
                {
                  v42 = sub_10000B718();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    sub_10000B76C(v79);
                    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Unable to allocate runningAverageCounts", v79, 2u);
                  }
                }
              }
              else
              {
                v43 = sub_10000B718();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  double v1 = +[NSNumber numberWithUnsignedInteger:v44];
                  sub_10000B774((uint64_t)v88, (uint64_t)v1);
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failing because powerLevelsCount is out of bounds: %@", v88, 0xCu);
                }
              }
            }
          }
          else
          {
            v48 = sub_10000B718();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              sub_10000B76C(v80);
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Container is not CAF.", v80, 2u);
            }
          }
        }
      }
      else
      {
        v57 = sub_10000B718();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          sub_10000B774((uint64_t)v91, (uint64_t)v64);
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Unable to open file url: %@", v91, 0xCu);
        }
      }
    }
    else
    {
      v58 = sub_10000B718();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        sub_10000B76C(v81);
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "No input file URL", v81, 2u);
      }
    }
  }
  else
  {
    v59 = sub_10000B718();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      sub_10000B76C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Couldn't allocate output buffer", buf, 2u);
    }
  }
  if (outExtAudioFile) {
    ExtAudioFileDispose(outExtAudioFile);
  }
  if (v60) {
    free(v60);
  }
  [(AudioMetadata *)v63 setPowerLevels:v62];
  v65 = v63;

  return v65;
}

id sub_10000B718()
{
  if (qword_1000436F0 != -1) {
    dispatch_once(&qword_1000436F0, &stru_10003D5B0);
  }
  v0 = (void *)qword_1000436F8;

  return v0;
}

_WORD *sub_10000B76C(_WORD *result)
{
  *result = 0;
  return result;
}

double sub_10000B774(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 138412290;
  *(_DWORD *)a1 = 138412290;
  *(void *)(a1 + 4) = a2;
  return result;
}

CFStringRef sub_10000B788(int a1)
{
  if ((a1 & 0x80000000) == 0)
  {
    if (a1 > 561213538)
    {
      if (a1 == 561213539) {
        return @"kAudioServicesBadSpecifierSizeError";
      }
      if (a1 == 1886681407) {
        return @"kAudioServicesUnsupportedPropertyError";
      }
    }
    else
    {
      if (!a1) {
        return @"kAudioServicesNoError";
      }
      if (a1 == 561211770) {
        return @"kAudioServicesBadPropertySizeError";
      }
    }
    return @"Unknown Error";
  }
  if (a1 == -1502) {
    return @"kAudioServicesSystemSoundExceededMaximumDurationError";
  }
  if (a1 != -1501)
  {
    if (a1 == -1500) {
      return @"kAudioServicesSystemSoundUnspecifiedError";
    }
    return @"Unknown Error";
  }
  return @"kAudioServicesSystemSoundClientTimedOutError";
}

void sub_10000B848(id a1)
{
  qword_1000436F8 = (uint64_t)os_log_create("com.apple.Messages.blastdoor", "AudioPreviewLevelsGenerator");

  _objc_release_x1();
}

void sub_10000B8E0(id a1)
{
  qword_100043700 = objc_alloc_init(MBDXMLParser);

  _objc_release_x1();
}

id sub_10000BB4C(uint64_t a1, void *a2)
{
  OSStatus v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v3 reset];
  id v5 = [objc_alloc((Class)NSXMLParser) initWithData:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  float v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = *(void *)(a1 + 32);
  float v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  double v13 = *(void **)(*(void *)(a1 + 32) + 8);

  return _[v13 parse];
}

void sub_10000BC08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  OSStatus v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:0];
  uint64_t v6 = *(void *)(a1 + 32);
  float v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;
}

objc_class *sub_10000C268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v5 == v4)
  {
LABEL_5:
    uint64_t v11 = 0;
  }
  else
  {
    Superclass = (objc_class *)v5;
    while (1)
    {
      IMP MethodImplementation = class_getMethodImplementation(Superclass, "name");
      id v8 = ((void (*)(void, const char *))MethodImplementation)(*(void *)(a1 + 32), "name");
      uint64_t v9 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@_%@_Frame", v8, a2];
      Class v10 = NSClassFromString(v9);
      if (v10) {
        break;
      }
      Superclass = class_getSuperclass(Superclass);

      if (Superclass == (objc_class *)v4) {
        goto LABEL_5;
      }
    }
    uint64_t v11 = v10;
  }

  return v11;
}

id sub_10000C468()
{
  if (qword_100043720 != -1) {
    dispatch_once(&qword_100043720, &stru_10003D668);
  }
  v0 = (void *)qword_100043718;

  return v0;
}

void sub_10000C86C(id a1)
{
  double v1 = +[NSCharacterSet controlCharacterSet];
  id v2 = [v1 mutableCopy];

  [v2 invert];
  OSStatus v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  [v2 invert];
  WORD2(v7) = 6158;
  LODWORD(v7) = 537731084;
  id v4 = [objc_alloc((Class)NSString) initWithCharactersNoCopy:&v7 length:3 freeWhenDone:0];
  objc_msgSend(v2, "removeCharactersInString:", v4, v7);
  id v5 = [v2 copy];
  uint64_t v6 = (void *)qword_100043718;
  qword_100043718 = (uint64_t)v5;
}

void sub_10000C974(id a1)
{
  double v1 = sub_10000C468();
  id v4 = [v1 mutableCopy];

  [v4 addCharactersInString:MBDIMAttachmentCharacterString];
  [v4 addCharactersInString:MBDIMBreadcrumbCharacterString];
  id v2 = [v4 copy];
  OSStatus v3 = (void *)qword_100043728;
  qword_100043728 = (uint64_t)v2;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000CE90(&qword_100043050);
  __chkstk_darwin();
  id v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032090();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  register_for_dlsym_callbacks();
  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
  sub_100032150();
  qword_1000450F0 = sub_100032110();
  sub_10000CE90(&qword_100043058);
  v9._rawValue = (void *)swift_allocObject();
  *((_OWORD *)v9._rawValue + 1) = xmmword_100037CC0;
  *((void *)v9._rawValue + 4) = 0x612E63696C627570;
  *((void *)v9._rawValue + 5) = 0xEB00000000696376;
  *((void *)v9._rawValue + 6) = 0x682E63696C627570;
  *((void *)v9._rawValue + 7) = 0xEB00000000636965;
  strcpy((char *)v9._rawValue + 64, "public.heics");
  *((unsigned char *)v9._rawValue + 77) = 0;
  *((_WORD *)v9._rawValue + 39) = -5120;
  *((void *)v9._rawValue + 10) = 0x682E63696C627570;
  *((void *)v9._rawValue + 11) = 0xEB00000000666965;
  *((void *)v9._rawValue + 12) = 0x6A2E63696C627570;
  *((void *)v9._rawValue + 13) = 0xEB00000000676570;
  *((void *)v9._rawValue + 14) = 0x702E63696C627570;
  *((void *)v9._rawValue + 15) = 0xEA0000000000676ELL;
  *((void *)v9._rawValue + 16) = 0xD000000000000012;
  *((void *)v9._rawValue + 17) = 0x8000000100036E90;
  qword_1000450F8 = (uint64_t)v9._rawValue;
  sub_1000320E0(v9, 1);
  v10._rawValue = &off_10003D788;
  qword_100045100 = (uint64_t)&off_10003D788;
  sub_1000320F0(v10);
  sub_100032480();
  sub_10000CED4();
  sub_100032120();
  sub_1000321C0();
  sub_10000CF28();
  sub_100032120();
  sub_1000324B0();
  sub_10000CF7C();
  sub_100032120();
  sub_1000321B0();
  sub_10000CFD0();
  sub_100032120();
  sub_100032080();
  sub_100032650();
  sub_10000D6D0(&qword_100043080, (void (*)(uint64_t))&type metadata accessor for RelayGroupMutationMessageUnpacker);
  sub_100032120();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000322D0();
  sub_10000D024();
  sub_100032130();
  sub_1000323F0();
  sub_10000D078();
  sub_100032140();
  sub_1000322A0();
  sub_10000D0CC();
  sub_100032130();
  uint64_t v11 = sub_100032800();
  sub_10000D120(v11, qword_100045108);
  uint64_t v12 = sub_10000D184(v11, (uint64_t)qword_100045108);
  uint64_t v13 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, enum case for SandboxID.airlock(_:), v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v4, v12, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v4, 0, 1, v11);
  sub_100032100();
  sub_10000D1BC((uint64_t)v4);
  return 0;
}

uint64_t sub_10000CE90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000CED4()
{
  unint64_t result = qword_100043060;
  if (!qword_100043060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043060);
  }
  return result;
}

unint64_t sub_10000CF28()
{
  unint64_t result = qword_100043068;
  if (!qword_100043068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043068);
  }
  return result;
}

unint64_t sub_10000CF7C()
{
  unint64_t result = qword_100043070;
  if (!qword_100043070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043070);
  }
  return result;
}

unint64_t sub_10000CFD0()
{
  unint64_t result = qword_100043078;
  if (!qword_100043078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043078);
  }
  return result;
}

unint64_t sub_10000D024()
{
  unint64_t result = qword_100043088;
  if (!qword_100043088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043088);
  }
  return result;
}

unint64_t sub_10000D078()
{
  unint64_t result = qword_100043090;
  if (!qword_100043090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043090);
  }
  return result;
}

unint64_t sub_10000D0CC()
{
  unint64_t result = qword_100043098;
  if (!qword_100043098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043098);
  }
  return result;
}

uint64_t *sub_10000D120(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000D184(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000D1BC(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_100043050);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 sub_10000D21C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_10000D254(uint64_t a1, uint64_t a2)
{
  return sub_10000D34C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000D26C()
{
  sub_100032870();
  sub_1000328E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000D2C0()
{
  sub_100032870();
  sub_100032DE0();
  sub_1000328E0();
  Swift::Int v0 = sub_100032E00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000D334(uint64_t a1, uint64_t a2)
{
  return sub_10000D34C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000D34C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100032870();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000D390(uint64_t a1, id *a2)
{
  uint64_t result = sub_100032850();
  *a2 = 0;
  return result;
}

uint64_t sub_10000D408(uint64_t a1, id *a2)
{
  char v3 = sub_100032860();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000D488@<X0>(void *a1@<X8>)
{
  sub_100032870();
  NSString v2 = sub_100032840();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000D4CC()
{
  uint64_t v0 = sub_100032870();
  uint64_t v2 = v1;
  if (v0 == sub_100032870() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100032D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000D558@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100032840();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000D5A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100032870();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000D5CC(uint64_t a1)
{
  uint64_t v2 = sub_10000D6D0(&qword_1000430C8, type metadata accessor for Key);
  uint64_t v3 = sub_10000D6D0(&qword_1000430D0, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000D688()
{
  return sub_10000D6D0(&qword_1000430B0, type metadata accessor for Key);
}

uint64_t sub_10000D6D0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D718()
{
  return sub_10000D6D0(&qword_1000430B8, type metadata accessor for Key);
}

uint64_t sub_10000D760()
{
  return sub_10000D6D0(&qword_1000430C0, type metadata accessor for Key);
}

uint64_t initializeBufferWithCopyOfBuffer for BasicMessageDictionary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000D7DC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_10000D7F0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000D810(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

uint64_t sub_10000D85C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000D87C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

__n128 sub_10000D8B8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_10000D8CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000D8EC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_10000D954(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

ValueMetadata *type metadata accessor for SMSMessageUnpacker()
{
  return &type metadata for SMSMessageUnpacker;
}

uint64_t sub_10000D9B4()
{
  return sub_10000ED0C(&qword_100043100, (void (*)(uint64_t))&type metadata accessor for SMSMessage);
}

uint64_t sub_10000D9FC@<X0>(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v157 = (char *)a1;
  v158 = a2;
  uint64_t v138 = a3;
  uint64_t v3 = sub_10000CE90(&qword_100043108);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v146 = (uint64_t)v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v145 = (char *)v99 - v6;
  uint64_t v7 = sub_10000CE90(&qword_100043110);
  __chkstk_darwin(v7 - 8);
  v147 = (char *)v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_10000CE90(&qword_100043118);
  uint64_t v137 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  v144 = (char *)v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_10000CE90(&qword_100043120);
  uint64_t v136 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  v154 = (char *)v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000CE90(&qword_100043128);
  __chkstk_darwin(v11 - 8);
  uint64_t v141 = (uint64_t)v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000321A0();
  __chkstk_darwin(v13 - 8);
  uint64_t v140 = (uint64_t)v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000CE90(&qword_100043130);
  __chkstk_darwin(v15 - 8);
  v139 = (void (**)(char *, uint64_t, uint64_t))((char *)v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v143 = (unsigned int (**)(void, void, void))sub_100032180();
  v142 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))*(v143 - 1);
  __chkstk_darwin(v143);
  v18 = (char *)v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000327E0();
  __chkstk_darwin(v19 - 8);
  long long v21 = (char *)v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000327F0();
  uint64_t v155 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  double v24 = (char *)v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000CE90(&qword_100043138);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  id v28 = (char *)v99 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v30 = (char *)v99 - v29;
  uint64_t v31 = type metadata accessor for SMSDictionary();
  __chkstk_darwin(v31);
  double v33 = (char *)v99 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031F00();
  swift_allocObject();
  uint64_t v34 = sub_100031EF0();
  sub_10000ED0C(&qword_100043140, (void (*)(uint64_t))type metadata accessor for SMSDictionary);
  uint64_t v35 = v162;
  sub_100031EE0();
  uint64_t v162 = v35;
  if (v35) {
    return swift_release();
  }
  v157 = v24;
  unint64_t v151 = v22;
  v153 = v21;
  v134 = v18;
  v131 = v28;
  uint64_t v132 = v34;
  v133 = v30;
  uint64_t v37 = *(int *)(v31 + 88);
  v135 = v33;
  if (*(void *)&v33[v37]) {
    id v38 = *(unint64_t **)&v33[v37];
  }
  else {
    id v38 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  int64_t v39 = v38[2];
  double v40 = (int *)v31;
  if (v39)
  {
    v129 = (int *)v31;
    v159 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_10000ED54(0, v39, 0);
    v41 = v159;
    v150 = (void (**)(char *, uint64_t))(v155 + 32);
    uint64_t v42 = 4;
    v152 = v38;
    do
    {
      uint64_t v156 = v39;
      v158 = v41;
      long long v43 = *(_OWORD *)&v38[v42 + 2];
      long long v45 = *(_OWORD *)&v38[v42 + 4];
      long long v44 = *(_OWORD *)&v38[v42 + 6];
      v161[0] = *(_OWORD *)&v38[v42];
      v161[1] = v43;
      v161[2] = v45;
      v161[3] = v44;
      sub_10000ED74((uint64_t)v161);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v46 = v162;
      sub_10002E598((uint64_t)v153);
      if (v46)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10000EE44((uint64_t)v161);
        swift_release();
        swift_release();
        sub_10000EF14((uint64_t)v135);
        return swift_bridgeObjectRelease();
      }
      sub_1000327D0();
      uint64_t v162 = 0;
      sub_10000EE44((uint64_t)v161);
      v41 = v158;
      v159 = v158;
      unint64_t v48 = v158[2];
      unint64_t v47 = v158[3];
      id v38 = v152;
      if (v48 >= v47 >> 1)
      {
        sub_10000ED54(v47 > 1, v48 + 1, 1);
        v41 = v159;
      }
      v41[2] = v48 + 1;
      (*(void (**)(unint64_t, char *, unint64_t))(v155 + 32))((unint64_t)v41+ ((*(unsigned __int8 *)(v155 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v155 + 80))+ *(void *)(v155 + 72) * v48, v157, v151);
      v42 += 8;
      int64_t v39 = v156 - 1;
    }
    while (v156 != 1);
    uint64_t v49 = (uint64_t)v133;
    double v40 = v129;
  }
  else
  {
    swift_bridgeObjectRetain();
    v41 = &_swiftEmptyArrayStorage;
    uint64_t v49 = (uint64_t)v133;
  }
  id v50 = v143;
  v51 = v142;
  swift_bridgeObjectRetain();
  sub_100032680();
  uint64_t v52 = v162;
  sub_100032160();
  if (v52)
  {
    swift_errorRelease();
    uint64_t v53 = sub_100032170();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v49, 1, 1, v53);
  }
  else
  {
    uint64_t v54 = sub_100032170();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v49, 0, 1, v54);
  }
  uint64_t v55 = (uint64_t)v135;
  OSStatus v56 = v139;
  uint64_t v128 = *(void *)v135;
  int v127 = v135[8];
  sub_10000F068((uint64_t)&v135[v40[5]], (uint64_t)v139, &qword_100043130);
  if (((unsigned int (*)(void, uint64_t, void))v51[6])(v56, 1, v50) == 1)
  {
    ((void (*)(char *, void, unsigned int (**)(void, void, void)))v51[13])(v134, enum case for SMSMessage.FilterSubCategoryType.filterSubCategoryNone(_:), v50);
    sub_10000F0CC((uint64_t)v56, &qword_100043130);
  }
  else
  {
    ((void (*)(char *, void, unsigned int (**)(void, void, void)))v51[4])(v134, v56, v50);
  }
  v57 = (uint64_t *)(v55 + v40[6]);
  uint64_t v58 = *v57;
  uint64_t v59 = v57[1];
  swift_bridgeObjectRetain();
  sub_100014960(v140);
  uint64_t v162 = 0;
  uint64_t v124 = v58;
  uint64_t v125 = v59;
  v158 = v41;
  uint64_t v60 = v40[9];
  uint64_t v126 = *(void *)(v55 + v40[8]);
  sub_10000F068(v55 + v60, v141, &qword_100043128);
  uint64_t v61 = v40[11];
  id v62 = (uint64_t *)(v55 + v40[10]);
  uint64_t v63 = v62[1];
  uint64_t v123 = *v62;
  uint64_t v121 = *(void *)(v55 + v61);
  int v120 = *(unsigned __int8 *)(v55 + v61 + 8);
  uint64_t v64 = v40[13];
  v65 = (uint64_t *)(v55 + v40[12]);
  uint64_t v66 = v65[1];
  uint64_t v119 = *v65;
  uint64_t v67 = *(void *)(v55 + v64 + 8);
  uint64_t v117 = *(void *)(v55 + v64);
  uint64_t v68 = v40[15];
  UInt32 v69 = (uint64_t *)(v55 + v40[14]);
  uint64_t v70 = v69[1];
  uint64_t v115 = *v69;
  uint64_t v71 = *(void *)(v55 + v68 + 8);
  uint64_t v113 = *(void *)(v55 + v68);
  uint64_t v72 = v40[17];
  v73 = (uint64_t *)(v55 + v40[16]);
  uint64_t v74 = v73[1];
  uint64_t v111 = *v73;
  uint64_t v75 = *(void *)(v55 + v72 + 8);
  uint64_t v109 = *(void *)(v55 + v72);
  uint64_t v76 = v40[19];
  uint64_t v77 = v55 + v40[18];
  uint64_t v107 = *(void *)v77;
  int v106 = *(unsigned __int8 *)(v77 + 8);
  uint64_t v78 = *(void *)(v55 + v76 + 8);
  uint64_t v105 = *(void *)(v55 + v76);
  uint64_t v104 = v78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v122 = v63;
  swift_bridgeObjectRetain();
  uint64_t v118 = v66;
  swift_bridgeObjectRetain();
  uint64_t v116 = v67;
  swift_bridgeObjectRetain();
  uint64_t v114 = v70;
  swift_bridgeObjectRetain();
  uint64_t v112 = v71;
  swift_bridgeObjectRetain();
  uint64_t v110 = v74;
  swift_bridgeObjectRetain();
  uint64_t v108 = v75;
  swift_bridgeObjectRetain();
  uint64_t v103 = sub_100014B68();
  uint64_t v102 = v79;
  v80 = (uint64_t *)(v55 + v40[21]);
  uint64_t v81 = v80[1];
  uint64_t v101 = *v80;
  uint64_t v82 = v40[24];
  v99[1] = *(unsigned __int8 *)(v55 + v40[23]);
  v99[0] = *(unsigned __int8 *)(v55 + v82);
  unint64_t v83 = v38[2];
  uint64_t v100 = v81;
  if (!v83)
  {
    swift_bridgeObjectRetain();
    LODWORD(v156) = 0;
    uint64_t v98 = (uint64_t)v135;
    goto LABEL_34;
  }
  v129 = v40;
  v143 = (unsigned int (**)(void, void, void))(v137 + 48);
  v139 = (void (**)(char *, uint64_t, uint64_t))(v137 + 32);
  v130 = (void (**)(char *, uint64_t))(v137 + 8);
  v150 = (void (**)(char *, uint64_t))(v136 + 8);
  v142 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v137 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v84 = v38 + 11;
  unint64_t v151 = 0x8000000100036EB0;
  v152 = v38;
  uint64_t v85 = v149;
  uint64_t v86 = v148;
  uint64_t v87 = (uint64_t)v147;
  while (1)
  {
    uint64_t v89 = *(v84 - 1);
    unint64_t v88 = *v84;
    v91 = (void *)*(v84 - 5);
    uint64_t v90 = *(v84 - 4);
    uint64_t v92 = *(v84 - 6);
    v153 = (char *)*(v84 - 2);
    swift_bridgeObjectRetain();
    uint64_t v155 = v92;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v156 = v89;
    v157 = (char *)v88;
    sub_10000EDD8(v89, v88);
    sub_10000CE90(&qword_100043148);
    sub_100032000();
    if (v90) {
      break;
    }
    (*v142)(v87, 1, 1, v85);
LABEL_24:
    (*v150)(v154, v86);
    sub_10000F0CC(v87, &qword_100043110);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_25:
    v84 += 8;
    swift_bridgeObjectRelease();
    sub_10000EEA8(v156, (unint64_t)v157);
    if (!--v83)
    {
      swift_bridgeObjectRelease();
      LODWORD(v156) = 0;
      goto LABEL_33;
    }
  }
  v159 = v91;
  uint64_t v160 = v90;
  sub_10000EF70();
  sub_10000EFC4();
  uint64_t v85 = v149;
  sub_100032830();
  if ((*v143)(v87, 1, v85) == 1) {
    goto LABEL_24;
  }
  v93 = v144;
  (*v139)(v144, v87, v85);
  swift_getKeyPath();
  sub_100032010();
  swift_release();
  sub_1000328C0();
  swift_bridgeObjectRelease();
  uint64_t v94 = (uint64_t)v145;
  sub_100031F80();
  swift_bridgeObjectRelease();
  uint64_t v95 = v146;
  sub_10000F068(v94, v146, &qword_100043108);
  uint64_t v96 = sub_100031FA0();
  uint64_t v97 = *(void *)(v96 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v95, 1, v96) == 1)
  {
    sub_10000F0CC(v94, &qword_100043108);
    uint64_t v85 = v149;
    (*v130)(v93, v149);
    uint64_t v86 = v148;
    (*v150)(v154, v148);
    sub_10000F0CC(v95, &qword_100043108);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v87 = (uint64_t)v147;
    goto LABEL_25;
  }
  sub_100031F90();
  sub_10000F0CC(v94, &qword_100043108);
  (*v130)(v93, v149);
  (*v150)(v154, v148);
  (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v95, v96);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v156, (unint64_t)v157);
  swift_bridgeObjectRelease();
  LODWORD(v156) = 1;
LABEL_33:
  uint64_t v98 = (uint64_t)v135;
  double v40 = v129;
LABEL_34:
  swift_bridgeObjectRelease();
  v157 = *(char **)(v98 + v40[29]);
  sub_10000F068((uint64_t)v133, (uint64_t)v131, &qword_100043138);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100032190();
  swift_release();
  sub_10000F0CC((uint64_t)v133, &qword_100043138);
  return sub_10000EF14(v98);
}

uint64_t sub_10000ECF4@<X0>(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000D9FC(a1, a2, a3);
}

uint64_t sub_10000ED0C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000ED54(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000F148(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000ED74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000EDD8(v2, v3);
  return a1;
}

uint64_t sub_10000EDD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000EDEC(a1, a2);
  }
  return a1;
}

uint64_t sub_10000EDEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000EE44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v2, v3);
  return a1;
}

uint64_t sub_10000EEA8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000EEBC(a1, a2);
  }
  return a1;
}

uint64_t sub_10000EEBC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10000EF14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SMSDictionary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000EF70()
{
  unint64_t result = qword_100043150;
  if (!qword_100043150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043150);
  }
  return result;
}

unint64_t sub_10000EFC4()
{
  unint64_t result = qword_100043158;
  if (!qword_100043158)
  {
    sub_10000F020(&qword_100043120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043158);
  }
  return result;
}

uint64_t sub_10000F020(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000F068(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000CE90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F0CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000CE90(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000F128(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000F38C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000F148(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000CE90(&qword_100043160);
  uint64_t v10 = *(void *)(sub_1000327F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1000327F0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  long long v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100032C50();
  __break(1u);
  return result;
}

uint64_t sub_10000F38C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CE90(&qword_100043168);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100032C50();
  __break(1u);
  return result;
}

void BasicMessage.init(messageDictionary:)(char **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000CE90(&qword_100043170);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  int64_t v11 = (char *)&v25 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  id v14 = [self sharedInstance];
  uint64_t v15 = v14;
  uint64_t v16 = a1[8];
  uint64_t v29 = a2;
  if (v16)
  {
    uint64_t v26 = v13;
  }
  else
  {
    if (!a1[6])
    {
      id v25 = v14;
      sub_10000FAE8((uint64_t)(a1 + 3), (uint64_t)v27, &qword_100043178);
      sub_10000FAE8((uint64_t)v27, (uint64_t)v28, &qword_100043178);
      uint64_t v23 = sub_100032530();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
      uint64_t v22 = (uint64_t)v13;
      goto LABEL_11;
    }
    uint64_t v26 = v13;
    swift_bridgeObjectRetain();
  }
  id v17 = objc_allocWithZone((Class)MBDMessageToSuperParserContext);
  swift_bridgeObjectRetain();
  NSString v18 = sub_100032840();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithContent:v18];

  if (![v15 parseContext:v19])
  {
    sub_1000327C0();
    sub_10000FA90();
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();
    goto LABEL_9;
  }
  _AttributedString.init(fromNSAttributedString:)([v19 body], (uint64_t)v11);
  if (v2)
  {
LABEL_9:
    sub_10000F900(a1);

    return;
  }
  id v25 = v15;

  uint64_t v20 = sub_100032530();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 0, 1, v20);
  uint64_t v21 = (uint64_t)v11;
  uint64_t v22 = (uint64_t)v26;
  sub_10000FAE8(v21, (uint64_t)v26, &qword_100043170);
LABEL_11:
  double v24 = (char *)&_swiftEmptyArrayStorage;
  if (*a1) {
    double v24 = *a1;
  }
  uint64_t v26 = v24;
  sub_10000F898(v22, (uint64_t)v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000321E0();

  sub_10000F900(a1);
  sub_10000FA30(v22);
}

uint64_t sub_10000F898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CE90(&qword_100043170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_10000F900(void *a1)
{
  uint64_t v3 = a1[10];
  unint64_t v2 = a1[11];
  unint64_t v5 = a1[29];
  uint64_t v6 = a1[28];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000FA30(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_100043170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000FA90()
{
  unint64_t result = qword_100043180;
  if (!qword_100043180)
  {
    sub_1000327C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043180);
  }
  return result;
}

uint64_t sub_10000FAE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000CE90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FB4C()
{
  uint64_t v1 = sub_10000CE90(&qword_1000431A8);
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100032BE0();
  uint64_t v3 = __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  unint64_t v4 = *(void *)(v0 + 232);
  if (v4 >> 60 == 15) {
    return 0;
  }
  uint64_t v5 = *(void *)(v0 + 224);
  sub_100031F00();
  swift_allocObject();
  sub_10000EDEC(v5, v4);
  sub_100031EF0();
  sub_100010250();
  sub_100031EE0();
  swift_release();
  sub_10000EEA8(v5, v4);
  return v7;
}

uint64_t sub_10000FF78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100032220();
  __chkstk_darwin(v2 - 8);
  sub_10000FB4C();
  if (v3 == 1)
  {
    uint64_t v4 = sub_100032240();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a1, 1, 1, v4);
  }
  else
  {
    sub_100032210();
    sub_100032230();
    uint64_t v7 = sub_100032240();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
  }
}

unint64_t sub_1000101BC()
{
  unint64_t result = qword_100043188;
  if (!qword_100043188)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100043188);
  }
  return result;
}

unint64_t sub_1000101FC()
{
  unint64_t result = qword_1000431A0;
  if (!qword_1000431A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431A0);
  }
  return result;
}

unint64_t sub_100010250()
{
  unint64_t result = qword_1000431B0;
  if (!qword_1000431B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431B0);
  }
  return result;
}

uint64_t sub_1000102A4(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_1000431A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for BasicPreviewAudioUnpacker()
{
  return &type metadata for BasicPreviewAudioUnpacker;
}

unint64_t sub_100010318()
{
  unint64_t result = qword_1000431B8;
  if (!qword_1000431B8)
  {
    sub_1000322A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431B8);
  }
  return result;
}

uint64_t sub_100010370()
{
  return 1;
}

Swift::Int sub_100010378()
{
  return sub_100032E00();
}

void sub_1000103BC()
{
}

Swift::Int sub_1000103E4()
{
  return sub_100032E00();
}

void sub_100010434()
{
  uint64_t v0 = sub_100031F40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100032730();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000326F0();
  sub_100032720();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100031F20(v8);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  int64_t v11 = audioMetadataForFileURL(v10);

  if (v11)
  {
    uint64_t v12 = [(AudioMetadata *)v11 powerLevels];
    if (v12)
    {
      uint64_t v13 = v12;
      sub_100010908();
      unint64_t v14 = sub_100032980();

      uint64_t v15 = sub_100010684(v14);
      swift_bridgeObjectRelease();
      if (v15)
      {
        [(AudioMetadata *)v11 duration];
        sub_100032290();

        return;
      }
    }
  }
  sub_1000108B4();
  swift_allocError();
  swift_willThrow();
}

void *sub_100010684(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100032C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  sub_10000F128(0, v3 & ~(v3 >> 63), 0);
  uint64_t v4 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100032C10();
    swift_bridgeObjectRelease();
    if (!v6) {
      return v4;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0) {
    id v7 = (id)sub_100032BD0();
  }
  else {
    id v7 = *(id *)(a1 + 32);
  }
  uint64_t v8 = v7;
  sub_100032A00();

  swift_release();
  return 0;
}

uint64_t sub_10001082C()
{
  return sub_1000326C0();
}

void sub_100010898()
{
}

unint64_t sub_1000108B4()
{
  unint64_t result = qword_1000431C0;
  if (!qword_1000431C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431C0);
  }
  return result;
}

unint64_t sub_100010908()
{
  unint64_t result = qword_1000431C8;
  if (!qword_1000431C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000431C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BasicPreviewAudioUnpacker.BasicPreviewAudioUnpackerError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for BasicPreviewAudioUnpacker.BasicPreviewAudioUnpackerError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100010A38);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100010A60()
{
  return 0;
}

ValueMetadata *type metadata accessor for BasicPreviewAudioUnpacker.BasicPreviewAudioUnpackerError()
{
  return &type metadata for BasicPreviewAudioUnpacker.BasicPreviewAudioUnpackerError;
}

unint64_t sub_100010A80()
{
  unint64_t result = qword_1000431D0;
  if (!qword_1000431D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431D0);
  }
  return result;
}

uint64_t BasicMessageDictionary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000CE90(&qword_1000431D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000110D0(a1, a1[3]);
  sub_100011114();
  sub_100032E20();
  v10[0] = 0;
  sub_100032D20();
  if (!v2)
  {
    v10[0] = 1;
    sub_100032CF0();
    v10[0] = 2;
    sub_100032CF0();
    v10[0] = 3;
    sub_100032CF0();
    sub_10000FAE8(v3, (uint64_t)v15, &qword_1000431E8);
    sub_10000FAE8((uint64_t)v15, (uint64_t)v10, &qword_1000431E8);
    char v11 = 4;
    sub_10000CE90(&qword_1000431F0);
    sub_100013704(&qword_1000431F8);
    sub_100032D30();
    v10[0] = 5;
    sub_100032CF0();
    v10[0] = 6;
    sub_100032CF0();
    v10[0] = 7;
    sub_100032CF0();
    v10[0] = 8;
    sub_100032CF0();
    v10[0] = 9;
    sub_100032D00();
    v10[0] = 10;
    sub_100032D00();
    sub_10000FAE8(v3 + 80, (uint64_t)v14, &qword_100043200);
    sub_10000FAE8((uint64_t)v14, (uint64_t)v10, &qword_100043200);
    char v11 = 11;
    sub_100011168();
    sub_100032D30();
    v10[0] = 12;
    sub_100032D10();
    v10[0] = 13;
    sub_100032CF0();
    v10[0] = 14;
    sub_100032CF0();
    v10[0] = 15;
    sub_100032CF0();
    sub_10000FAE8(v3 + 224, (uint64_t)v13, &qword_100043200);
    sub_10000FAE8((uint64_t)v13, (uint64_t)v10, &qword_100043200);
    char v11 = 16;
    sub_100032D30();
    v10[0] = 17;
    sub_100032D10();
    v10[0] = 18;
    sub_100032CF0();
    v10[0] = 19;
    sub_100032CF0();
    v10[0] = 20;
    sub_100032D20();
    v10[0] = 21;
    sub_100032D40();
    v10[0] = 22;
    sub_100032CF0();
    sub_10000FAE8(v3 + 336, (uint64_t)v12, &qword_1000431E8);
    sub_10000FAE8((uint64_t)v12, (uint64_t)v10, &qword_1000431E8);
    char v11 = 23;
    sub_100032D30();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void *sub_1000110D0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100011114()
{
  unint64_t result = qword_1000431E0;
  if (!qword_1000431E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000431E0);
  }
  return result;
}

unint64_t sub_100011168()
{
  unint64_t result = qword_100043208;
  if (!qword_100043208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043208);
  }
  return result;
}

void *BasicMessageDictionary.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = sub_100011704(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x158uLL);
  }
  return result;
}

uint64_t sub_100011210(void *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return BasicMessageDictionary.encode(to:)(a1);
}

MessagesAirlockService::BasicMessageDictionary::CodingKeys_optional __swiftcall BasicMessageDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (MessagesAirlockService::BasicMessageDictionary::CodingKeys_optional)24;
}

uint64_t BasicMessageSummaryInfoDictionary.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t BasicMessageDictionary.CodingKeys.rawValue.getter(char a1)
{
  uint64_t result = 110;
  switch(a1)
  {
    case 1:
      uint64_t result = 30311;
      break;
    case 2:
      uint64_t result = 6580583;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = 112;
      break;
    case 5:
      uint64_t result = 115;
      break;
    case 6:
      uint64_t result = 116;
      break;
    case 7:
      uint64_t result = 120;
      break;
    case 8:
      uint64_t result = 30825;
      break;
    case 9:
      uint64_t result = 117;
      break;
    case 10:
      uint64_t result = 97;
      break;
    case 11:
      uint64_t result = 808280425;
      break;
    case 12:
      uint64_t result = 28786;
      break;
    case 13:
      uint64_t result = 26484;
      break;
    case 14:
      uint64_t result = 6711156;
      break;
    case 15:
      uint64_t result = 6580578;
      break;
    case 16:
      uint64_t result = 6910829;
      break;
    case 17:
      uint64_t result = 7630177;
      break;
    case 18:
      uint64_t result = 7040353;
      break;
    case 19:
      uint64_t result = 6712673;
      break;
    case 20:
      uint64_t result = 0x636C726D61;
      break;
    case 21:
      uint64_t result = 0x6E6C726D61;
      break;
    case 22:
      uint64_t result = 6647137;
      break;
    case 23:
      uint64_t result = 26226;
      break;
    default:
      uint64_t result = 30320;
      break;
  }
  return result;
}

uint64_t sub_100011450(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = BasicMessageDictionary.CodingKeys.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == BasicMessageDictionary.CodingKeys.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100032D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_1000114DC()
{
  char v1 = *v0;
  sub_100032DE0();
  BasicMessageDictionary.CodingKeys.rawValue.getter(v1);
  sub_1000328E0();
  swift_bridgeObjectRelease();
  return sub_100032E00();
}

uint64_t sub_100011540()
{
  BasicMessageDictionary.CodingKeys.rawValue.getter(*v0);
  sub_1000328E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100011594()
{
  char v1 = *v0;
  sub_100032DE0();
  BasicMessageDictionary.CodingKeys.rawValue.getter(v1);
  sub_1000328E0();
  swift_bridgeObjectRelease();
  return sub_100032E00();
}

uint64_t sub_1000115F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s22MessagesAirlockService22BasicMessageDictionaryV10CodingKeysO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_100011624@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = BasicMessageDictionary.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100011650()
{
  return BasicMessageDictionary.CodingKeys.rawValue.getter(*v0);
}

uint64_t sub_100011658@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s22MessagesAirlockService22BasicMessageDictionaryV10CodingKeysO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_100011680(unsigned char *a1@<X8>)
{
  *a1 = 24;
}

uint64_t sub_10001168C(uint64_t a1)
{
  unint64_t v2 = sub_100011114();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000116C8(uint64_t a1)
{
  unint64_t v2 = sub_100011114();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100011704@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_10000CE90(&qword_100043228);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  v166 = a1;
  sub_1000110D0(a1, v9);
  sub_100011114();
  sub_100032E10();
  if (v2) {
    return (void *)sub_1000136B4((uint64_t)v166);
  }
  uint64_t v87 = a2;
  LOBYTE(v101) = 0;
  uint64_t v10 = sub_100032CB0();
  char v12 = v11;
  char v161 = v11 & 1;
  LOBYTE(v101) = 1;
  uint64_t v86 = sub_100032C80();
  LOBYTE(v101) = 2;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100032C80();
  uint64_t v99 = v14;
  uint64_t v85 = v15;
  LOBYTE(v101) = 3;
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100032C80();
  uint64_t v98 = v17;
  uint64_t v84 = v18;
  uint64_t v20 = v19;
  uint64_t v21 = sub_10000CE90(&qword_1000431F0);
  LOBYTE(v100[0]) = 4;
  uint64_t v22 = sub_100013704(&qword_100043230);
  uint64_t v97 = v20;
  swift_bridgeObjectRetain();
  uint64_t v83 = v22;
  sub_100032CC0();
  uint64_t v82 = v21;
  uint64_t v23 = v101;
  LOBYTE(v101) = 5;
  swift_bridgeObjectRetain();
  uint64_t v80 = sub_100032C80();
  uint64_t v81 = v23;
  LOBYTE(v101) = 6;
  uint64_t v25 = v24;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_100032C80();
  uint64_t v96 = v25;
  uint64_t v79 = v26;
  LOBYTE(v101) = 7;
  uint64_t v28 = v27;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_100032C80();
  uint64_t v95 = v28;
  uint64_t v78 = v29;
  LOBYTE(v101) = 8;
  uint64_t v31 = v30;
  swift_bridgeObjectRetain();
  uint64_t v77 = sub_100032C80();
  uint64_t v94 = v31;
  LOBYTE(v101) = 9;
  uint64_t v93 = v32;
  swift_bridgeObjectRetain();
  LODWORD(v31) = sub_100032C90();
  LOBYTE(v101) = 10;
  int v76 = sub_100032C90();
  LOBYTE(v100[0]) = 11;
  unint64_t v90 = sub_100013768();
  sub_100032CC0();
  uint64_t v33 = v101;
  LOBYTE(v101) = 12;
  uint64_t v74 = v33;
  unint64_t v75 = v102;
  sub_10000EDD8(v33, v102);
  uint64_t v72 = sub_100032CA0();
  int v73 = v34;
  char v163 = v34 & 1;
  LOBYTE(v101) = 13;
  uint64_t v70 = sub_100032C80();
  uint64_t v71 = v35;
  LOBYTE(v101) = 14;
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_100032C80();
  uint64_t v92 = v36;
  LOBYTE(v101) = 15;
  swift_bridgeObjectRetain();
  uint64_t v68 = sub_100032C80();
  uint64_t v91 = v37;
  LOBYTE(v100[0]) = 16;
  swift_bridgeObjectRetain();
  sub_100032CC0();
  uint64_t v38 = v101;
  LOBYTE(v101) = 17;
  uint64_t v89 = v38;
  unint64_t v90 = v102;
  sub_10000EDD8(v38, v102);
  uint64_t v66 = sub_100032CA0();
  int v67 = v39;
  char v159 = v39 & 1;
  LOBYTE(v101) = 18;
  uint64_t v64 = sub_100032C80();
  uint64_t v65 = v40;
  LOBYTE(v101) = 19;
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_100032C80();
  uint64_t v63 = v41;
  LOBYTE(v101) = 20;
  swift_bridgeObjectRetain();
  uint64_t v60 = sub_100032CB0();
  int v61 = v42;
  char v157 = v42 & 1;
  LOBYTE(v101) = 21;
  uint64_t v58 = sub_100032CD0();
  int v59 = v43;
  char v155 = v43 & 1;
  LOBYTE(v101) = 22;
  uint64_t v57 = sub_100032C80();
  uint64_t v88 = v44;
  char v152 = 23;
  swift_bridgeObjectRetain();
  sub_100032CC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v100[37]) = v61 & 1;
  LOBYTE(v100[39]) = v59 & 1;
  LOBYTE(v100[13]) = v73 & 1;
  LOBYTE(v100[19]) = v12 & 1;
  LOBYTE(v100[31]) = v67 & 1;
  uint64_t v83 = v153;
  v100[0] = v81;
  v100[1] = v80;
  v100[2] = v96;
  v100[3] = v79;
  v100[4] = v95;
  v100[5] = v78;
  v100[6] = v94;
  v100[7] = v77;
  v100[8] = v93;
  HIDWORD(v55) = v31;
  LOBYTE(v100[9]) = v31;
  BYTE1(v100[9]) = v76;
  uint64_t v46 = v74;
  unint64_t v45 = v75;
  v100[10] = v74;
  v100[11] = v75;
  v100[12] = v72;
  v100[14] = v70;
  v100[15] = v71;
  v100[16] = v69;
  v100[17] = v92;
  uint64_t v56 = v10;
  v100[18] = v10;
  v100[20] = v86;
  v100[21] = v99;
  v100[22] = v85;
  v100[23] = v98;
  v100[24] = v84;
  v100[25] = v97;
  v100[26] = v68;
  v100[27] = v91;
  v100[28] = v89;
  v100[29] = v90;
  v100[30] = v66;
  v100[32] = v64;
  v100[33] = v65;
  v100[34] = v62;
  v100[35] = v63;
  v100[36] = v60;
  v100[38] = v58;
  v100[40] = v57;
  v100[41] = v88;
  v100[42] = v153;
  sub_1000137BC(v100);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v89, v90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v47 = v46;
  unint64_t v48 = v45;
  sub_10000EEA8(v46, v45);
  uint64_t v49 = v81;
  swift_bridgeObjectRelease();
  uint64_t v50 = v96;
  swift_bridgeObjectRelease();
  uint64_t v51 = v95;
  swift_bridgeObjectRelease();
  uint64_t v52 = v94;
  swift_bridgeObjectRelease();
  uint64_t v53 = v93;
  swift_bridgeObjectRelease();
  sub_1000136B4((uint64_t)v166);
  uint64_t v101 = v49;
  unint64_t v102 = v80;
  uint64_t v103 = v50;
  uint64_t v104 = v79;
  uint64_t v105 = v51;
  uint64_t v106 = v78;
  uint64_t v107 = v52;
  uint64_t v108 = v77;
  uint64_t v109 = v53;
  char v110 = BYTE4(v55);
  char v111 = v76;
  int v112 = v164;
  __int16 v113 = v165;
  uint64_t v114 = v47;
  unint64_t v115 = v48;
  uint64_t v116 = v72;
  char v117 = v163;
  *(_DWORD *)uint64_t v118 = *(_DWORD *)v162;
  *(_DWORD *)&v118[3] = *(_DWORD *)&v162[3];
  uint64_t v119 = v70;
  uint64_t v120 = v71;
  uint64_t v121 = v69;
  uint64_t v122 = v92;
  uint64_t v123 = v56;
  char v124 = v161;
  *(_DWORD *)uint64_t v125 = *(_DWORD *)v160;
  *(_DWORD *)&v125[3] = *(_DWORD *)&v160[3];
  uint64_t v126 = v86;
  uint64_t v127 = v99;
  uint64_t v128 = v85;
  uint64_t v129 = v98;
  uint64_t v130 = v84;
  uint64_t v131 = v97;
  uint64_t v132 = v68;
  uint64_t v133 = v91;
  uint64_t v134 = v89;
  unint64_t v135 = v90;
  uint64_t v136 = v66;
  char v137 = v159;
  *(_DWORD *)&v138[3] = *(_DWORD *)&v158[3];
  *(_DWORD *)uint64_t v138 = *(_DWORD *)v158;
  uint64_t v139 = v64;
  uint64_t v140 = v65;
  uint64_t v141 = v62;
  uint64_t v142 = v63;
  uint64_t v143 = v60;
  char v144 = v157;
  *(_DWORD *)v145 = *(_DWORD *)v156;
  *(_DWORD *)&v145[3] = *(_DWORD *)&v156[3];
  uint64_t v146 = v58;
  char v147 = v155;
  *(_DWORD *)uint64_t v148 = *(_DWORD *)v154;
  *(_DWORD *)&v148[3] = *(_DWORD *)&v154[3];
  uint64_t v149 = v57;
  uint64_t v150 = v88;
  uint64_t v151 = v83;
  sub_10000F900(&v101);
  return memcpy(v87, v100, 0x158uLL);
}

uint64_t _s22MessagesAirlockService22BasicMessageDictionaryV10CodingKeysO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_100032D80();
  swift_bridgeObjectRelease();
  if (v0 >= 0x18) {
    return 24;
  }
  else {
    return v0;
  }
}

unint64_t sub_100012A4C()
{
  unint64_t result = qword_100043210;
  if (!qword_100043210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043210);
  }
  return result;
}

unint64_t sub_100012AA4()
{
  unint64_t result = qword_100043218;
  if (!qword_100043218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043218);
  }
  return result;
}

unint64_t sub_100012AFC()
{
  unint64_t result = qword_100043220;
  if (!qword_100043220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043220);
  }
  return result;
}

uint64_t destroy for BasicMessageDictionary(uint64_t *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = a1[11];
  if (v2 >> 60 != 15) {
    sub_10000EEBC(a1[10], v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v3 = a1[29];
  if (v3 >> 60 != 15) {
    sub_10000EEBC(a1[28], v3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BasicMessageDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  char v8 = (uint64_t *)(a2 + 80);
  unint64_t v9 = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v10 = *v8;
    sub_10000EDEC(*v8, v9);
    *(void *)(a1 + 80) = v10;
    *(void *)(a1 + 88) = v9;
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v13 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v13;
  uint64_t v14 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v14;
  uint64_t v15 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v15;
  uint64_t v16 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v16;
  uint64_t v17 = (uint64_t *)(a2 + 224);
  unint64_t v18 = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 224) = *(_OWORD *)v17;
  }
  else
  {
    uint64_t v19 = *v17;
    sub_10000EDEC(*v17, v18);
    *(void *)(a1 + 224) = v19;
    *(void *)(a1 + 232) = v18;
  }
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  uint64_t v20 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v20;
  uint64_t v21 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v21;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  uint64_t v22 = *(void *)(a2 + 304);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(void *)(a1 + 304) = v22;
  uint64_t v23 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v23;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BasicMessageDictionary(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  uint64_t v4 = (uint64_t *)(a2 + 80);
  unint64_t v5 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *v4;
      sub_10000EDEC(*v4, *(void *)(a2 + 88));
      *(void *)(a1 + 80) = v6;
      *(void *)(a1 + 88) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    sub_100013180(a1 + 80);
LABEL_6:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v7 = *v4;
  sub_10000EDEC(*v4, *(void *)(a2 + 88));
  uint64_t v8 = *(void *)(a1 + 80);
  unint64_t v9 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = v5;
  sub_10000EEBC(v8, v9);
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v10;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 144) = v11;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = (uint64_t *)(a2 + 224);
  unint64_t v13 = *(void *)(a2 + 232);
  if (*(void *)(a1 + 232) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_10000EDEC(*v12, *(void *)(a2 + 232));
      uint64_t v16 = *(void *)(a1 + 224);
      unint64_t v17 = *(void *)(a1 + 232);
      *(void *)(a1 + 224) = v15;
      *(void *)(a1 + 232) = v13;
      sub_10000EEBC(v16, v17);
      goto LABEL_15;
    }
    sub_100013180(a1 + 224);
    goto LABEL_13;
  }
  if (v13 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)(a1 + 224) = *(_OWORD *)v12;
    goto LABEL_15;
  }
  uint64_t v14 = *v12;
  sub_10000EDEC(*v12, *(void *)(a2 + 232));
  *(void *)(a1 + 224) = v14;
  *(void *)(a1 + 232) = v13;
LABEL_15:
  uint64_t v18 = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(void *)(a1 + 240) = v18;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(void *)(a1 + 288) = v19;
  uint64_t v20 = *(void *)(a2 + 304);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(void *)(a1 + 304) = v20;
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100013180(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for BasicMessageDictionary(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for BasicMessageDictionary(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  uint64_t v8 = (_OWORD *)(a2 + 80);
  unint64_t v9 = *(void *)(a1 + 88);
  if (v9 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v10 = *(void *)(a2 + 88);
  if (v10 >> 60 == 15)
  {
    sub_100013180(a1 + 80);
LABEL_4:
    *(_OWORD *)(a1 + 80) = *v8;
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)v8;
  *(void *)(a1 + 88) = v10;
  sub_10000EEBC(v11, v9);
LABEL_6:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)(a2 + 224);
  unint64_t v19 = *(void *)(a1 + 232);
  if (v19 >> 60 != 15)
  {
    unint64_t v20 = *(void *)(a2 + 232);
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *(void *)(a1 + 224);
      *(void *)(a1 + 224) = *v18;
      *(void *)(a1 + 232) = v20;
      sub_10000EEBC(v21, v19);
      goto LABEL_11;
    }
    sub_100013180(a1 + 224);
  }
  *(_OWORD *)(a1 + 224) = *(_OWORD *)v18;
LABEL_11:
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  uint64_t v22 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v23;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  uint64_t v24 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v24;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BasicMessageDictionary(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 344)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BasicMessageDictionary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 344) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 344) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicMessageDictionary()
{
  return &type metadata for BasicMessageDictionary;
}

unsigned char *initializeBufferWithCopyOfBuffer for BasicMessageDictionary.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BasicMessageDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE9) {
    goto LABEL_17;
  }
  if (a2 + 23 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 23) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 23;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 23;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 23;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x18;
  int v8 = v6 - 24;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BasicMessageDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 23 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 23) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE8)
  {
    unsigned int v6 = ((a2 - 233) >> 8) + 1;
    *unint64_t result = a2 + 23;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001366CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 23;
        break;
    }
  }
  return result;
}

uint64_t sub_100013694(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001369C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BasicMessageDictionary.CodingKeys()
{
  return &type metadata for BasicMessageDictionary.CodingKeys;
}

uint64_t sub_1000136B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100013704(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000F020(&qword_1000431F0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013768()
{
  unint64_t result = qword_100043238;
  if (!qword_100043238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043238);
  }
  return result;
}

void *sub_1000137BC(void *a1)
{
  uint64_t v2 = a1[10];
  unint64_t v3 = a1[11];
  unint64_t v5 = a1[29];
  uint64_t v6 = a1[28];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000EDD8(v2, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000EDD8(v6, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

ValueMetadata *type metadata accessor for ReadReceiptUnpacker()
{
  return &type metadata for ReadReceiptUnpacker;
}

unint64_t sub_1000138F8(uint64_t a1)
{
  unint64_t result = sub_10000CF28();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100013924()
{
  unint64_t result = qword_100043240;
  if (!qword_100043240)
  {
    sub_1000321C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043240);
  }
  return result;
}

uint64_t sub_10001397C(uint64_t a1, uint64_t a2)
{
  return sub_10001E6AC(a1, a2);
}

uint64_t sub_100013994(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 7564641;
  }
  else {
    uint64_t v2 = 6516065;
  }
  if (a2) {
    uint64_t v3 = 7564641;
  }
  else {
    uint64_t v3 = 6516065;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_100032D70();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_100013A00(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000100036E70;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEA00000000006469;
      unint64_t v5 = 0x2D746E65746E6F63;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1635017060;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701869940;
      break;
  }
  unint64_t v6 = 0x8000000100036E70;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA00000000006469;
      unint64_t v2 = 0x2D746E65746E6F63;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1635017060) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701869940) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_100032D70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_100013B70()
{
  return sub_100032E00();
}

Swift::Int sub_100013BD4()
{
  return sub_100032E00();
}

uint64_t sub_100013CA8()
{
  sub_1000328E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100013CEC()
{
  sub_1000328E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100013DAC()
{
  return sub_100032E00();
}

Swift::Int sub_100013E7C()
{
  return sub_100032E00();
}

uint64_t BasicMessageSummaryInfoDictionary.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = sub_10000CE90(&qword_100043248);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000110D0(a1, a1[3]);
  sub_100014050();
  sub_100032E20();
  char v14 = 0;
  sub_100032D10();
  if (!v5)
  {
    char v13 = 1;
    sub_100032CF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_100014050()
{
  unint64_t result = qword_100043250;
  if (!qword_100043250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043250);
  }
  return result;
}

uint64_t BasicMessageSummaryInfoDictionary.init(from:)(void *a1)
{
  uint64_t result = sub_100014358(a1);
  if (v1) {
    return v3 & 1;
  }
  return result;
}

uint64_t sub_1000140DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100014358(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_100014114(void *a1)
{
  return BasicMessageSummaryInfoDictionary.encode(to:)(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

MessagesAirlockService::BasicMessageSummaryInfoDictionary::CodingKeys_optional __swiftcall BasicMessageSummaryInfoDictionary.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_10003DA18;
  v6._object = object;
  Swift::Int v3 = sub_100032C70(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = MessagesAirlockService_BasicMessageSummaryInfoDictionary_CodingKeys_summary;
  }
  else {
    v4.value = MessagesAirlockService_BasicMessageSummaryInfoDictionary_CodingKeys_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

MessagesAirlockService::BasicMessageSummaryInfoDictionary::CodingKeys_optional __swiftcall BasicMessageSummaryInfoDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (MessagesAirlockService::BasicMessageSummaryInfoDictionary::CodingKeys_optional)2;
}

uint64_t BasicMessageSummaryInfoDictionary.CodingKeys.rawValue.getter(char a1)
{
  if (a1) {
    return 7564641;
  }
  else {
    return 6516065;
  }
}

uint64_t sub_1000141B8(char *a1, char *a2)
{
  return sub_100013994(*a1, *a2);
}

Swift::Int sub_1000141C4()
{
  return sub_100013B70();
}

uint64_t sub_1000141CC()
{
  return sub_100013CA8();
}

Swift::Int sub_1000141D4()
{
  return sub_100013E7C();
}

uint64_t sub_1000141DC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  Swift::Int v3 = (void *)a1[1];
  v4._rawValue = &off_10003DA18;
  v8._object = v3;
  Swift::Int v5 = sub_100032C70(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10001423C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = BasicMessageSummaryInfoDictionary.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100014268()
{
  return BasicMessageSummaryInfoDictionary.CodingKeys.rawValue.getter(*v0);
}

uint64_t sub_100014270@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_10003DA18;
  v9._object = a2;
  Swift::Int v6 = sub_100032C70(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

void sub_1000142D4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000142E0(uint64_t a1)
{
  unint64_t v2 = sub_100014050();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001431C(uint64_t a1)
{
  unint64_t v2 = sub_100014050();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100014358(void *a1)
{
  uint64_t v3 = sub_10000CE90(&qword_100043270);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_1000110D0(a1, v7);
  sub_100014050();
  sub_100032E10();
  if (!v1)
  {
    char v11 = 0;
    uint64_t v7 = sub_100032CA0();
    char v10 = 1;
    sub_100032C80();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_1000136B4((uint64_t)a1);
  return v7;
}

unint64_t sub_100014510()
{
  unint64_t result = qword_100043258;
  if (!qword_100043258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043258);
  }
  return result;
}

unint64_t sub_100014568()
{
  unint64_t result = qword_100043260;
  if (!qword_100043260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043260);
  }
  return result;
}

unint64_t sub_1000145C0()
{
  unint64_t result = qword_100043268;
  if (!qword_100043268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043268);
  }
  return result;
}

uint64_t destroy for BasicMessageSummaryInfoDictionary()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BasicMessageSummaryInfoDictionary(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BasicMessageSummaryInfoDictionary(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for BasicMessageSummaryInfoDictionary(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for BasicMessageSummaryInfoDictionary(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BasicMessageSummaryInfoDictionary(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BasicMessageSummaryInfoDictionary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicMessageSummaryInfoDictionary()
{
  return &type metadata for BasicMessageSummaryInfoDictionary;
}

uint64_t getEnumTagSinglePayload for BasicMessageSummaryInfoDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BasicMessageSummaryInfoDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001491CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100014944(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BasicMessageSummaryInfoDictionary.CodingKeys()
{
  return &type metadata for BasicMessageSummaryInfoDictionary.CodingKeys;
}

uint64_t sub_100014960@<X0>(uint64_t a1@<X8>)
{
  int v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SMSDictionary() + 28));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  BOOL v6 = *v3 == 7564659 && v5 == 0xE300000000000000;
  if (v6 || (sub_100032D70() & 1) != 0)
  {
    BOOL v7 = (unsigned int *)&enum case for SMSMessage.SMSType.sms(_:);
LABEL_19:
    uint64_t v10 = *v7;
    uint64_t v11 = sub_1000321A0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a1, v10, v11);
  }
  BOOL v8 = v4 == 7564653 && v5 == 0xE300000000000000;
  if (v8 || (sub_100032D70() & 1) != 0)
  {
    BOOL v7 = (unsigned int *)&enum case for SMSMessage.SMSType.mms(_:);
    goto LABEL_19;
  }
  BOOL v9 = v4 == 0x6E776F6E6B6E75 && v5 == 0xE700000000000000;
  if (v9 || (sub_100032D70() & 1) != 0)
  {
    BOOL v7 = (unsigned int *)&enum case for SMSMessage.SMSType.unknown(_:);
    goto LABEL_19;
  }
  sub_1000327C0();
  sub_100018E14((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
  swift_allocError();
  sub_1000327B0();
  return swift_willThrow();
}

uint64_t sub_100014B68()
{
  uint64_t v1 = type metadata accessor for SMSDictionary();
  __chkstk_darwin(v1);
  int v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000CE90(&qword_100043108);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v51 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)&v43 - v7;
  uint64_t v9 = sub_10000CE90(&qword_100043110);
  __chkstk_darwin(v9 - 8);
  uint64_t v58 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000CE90(&qword_100043118);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  char v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10000CE90(&qword_100043120);
  __chkstk_darwin(v52);
  uint64_t v60 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v0 + *(int *)(v1 + 88));
  if (!v17 || (uint64_t v57 = *(void *)(v17 + 16)) == 0)
  {
LABEL_13:
    sub_100015318(v0, (uint64_t)v3);
    uint64_t v37 = *(void *)&v3[*(int *)(v1 + 80)];
    swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  unint64_t v48 = v14;
  uint64_t v49 = v8;
  uint64_t v43 = v1;
  uint64_t v44 = v0;
  unint64_t v45 = v3;
  uint64_t v53 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  uint64_t v46 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
  uint64_t v47 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v56 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v50 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  swift_bridgeObjectRetain();
  unint64_t v18 = 0;
  unint64_t v19 = (uint64_t *)(v17 + 48);
  unint64_t v55 = 0x8000000100036EB0;
  uint64_t v59 = v11;
  uint64_t v20 = v52;
  uint64_t v21 = v60;
  uint64_t v54 = v17;
  while (1)
  {
    uint64_t v23 = *(v19 - 1);
    uint64_t v24 = *v19;
    uint64_t v25 = v19[1];
    uint64_t v26 = v19[4];
    unint64_t v27 = v19[5];
    uint64_t v61 = v19[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v62 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v63 = v27;
    uint64_t v64 = v26;
    sub_10000EDD8(v26, v27);
    sub_10000CE90(&qword_100043148);
    sub_100032000();
    if (v25) {
      break;
    }
    uint64_t v22 = (uint64_t)v58;
    (*v50)(v58, 1, 1, v59);
LABEL_5:
    (*v56)(v21, v20);
    sub_10000F0CC(v22, &qword_100043110);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    sub_10000EEA8(v64, v63);
    swift_bridgeObjectRelease();
    ++v18;
    v19 += 8;
    if (v57 == v18) {
      goto LABEL_12;
    }
  }
  *(void *)&v65[0] = v24;
  *((void *)&v65[0] + 1) = v25;
  sub_10000EF70();
  sub_10000EFC4();
  uint64_t v28 = v58;
  sub_100032830();
  uint64_t v22 = (uint64_t)v28;
  uint64_t v21 = v60;
  if ((*v53)(v22, 1, v59) == 1) {
    goto LABEL_5;
  }
  uint64_t v29 = v48;
  uint64_t v30 = v59;
  (*v46)(v48, v22, v59);
  swift_getKeyPath();
  sub_100032010();
  swift_release();
  sub_1000328C0();
  swift_bridgeObjectRelease();
  uint64_t v31 = (uint64_t)v49;
  sub_100031F80();
  swift_bridgeObjectRelease();
  uint64_t v32 = v51;
  sub_10001537C(v31, v51);
  uint64_t v33 = sub_100031FA0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) == 1)
  {
    sub_10000F0CC(v31, &qword_100043108);
    (*v47)(v29, v30);
    uint64_t v21 = v60;
    uint64_t v20 = v52;
    (*v56)(v60, v52);
    sub_10000F0CC(v32, &qword_100043108);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_100031F90();
  sub_10000F0CC(v31, &qword_100043108);
  (*v47)(v29, v30);
  (*v56)(v60, v52);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000EEA8(v64, v63);
  swift_bridgeObjectRelease();
  uint64_t v35 = v54;
  uint64_t result = swift_bridgeObjectRelease();
  if (v57 == v18)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    int v3 = v45;
    uint64_t v0 = v44;
    uint64_t v1 = v43;
    goto LABEL_13;
  }
  if (v18 >= *(void *)(v35 + 16))
  {
    __break(1u);
    goto LABEL_19;
  }
  long long v38 = *((_OWORD *)v19 - 1);
  long long v39 = *(_OWORD *)v19;
  long long v40 = *((_OWORD *)v19 + 2);
  v65[2] = *((_OWORD *)v19 + 1);
  v65[3] = v40;
  v65[0] = v38;
  v65[1] = v39;
  sub_10000ED74((uint64_t)v65);
  uint64_t v37 = sub_10002F824();
  uint64_t v42 = v41;
  uint64_t result = sub_10000EE44((uint64_t)v65);
  if (!v42)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  int v3 = v45;
  sub_100015318(v44, (uint64_t)v45);
LABEL_14:
  sub_10000EF14((uint64_t)v3);
  return v37;
}

uint64_t type metadata accessor for SMSDictionary()
{
  uint64_t result = qword_1000432D0;
  if (!qword_1000432D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100015318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SMSDictionary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001537C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CE90(&qword_100043108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000153E4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000CE90(&qword_1000433B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000110D0(a1, a1[3]);
  sub_100018D08();
  sub_100032E20();
  LOBYTE(v12) = 0;
  sub_100032D10();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for SMSDictionary();
    LOBYTE(v12) = 1;
    sub_100032180();
    sub_100018E14(&qword_1000433C0, (void (*)(uint64_t))&type metadata accessor for SMSMessage.FilterSubCategoryType);
    sub_100032D30();
    LOBYTE(v12) = 2;
    sub_100032D50();
    LOBYTE(v12) = 3;
    sub_100032D50();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 32));
    HIBYTE(v11) = 4;
    sub_10000CE90(&qword_1000431F0);
    sub_100013704(&qword_1000431F8);
    sub_100032D30();
    LOBYTE(v12) = 5;
    sub_100031F70();
    sub_100018E14(&qword_1000433C8, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100032D30();
    LOBYTE(v12) = 6;
    sub_100032CF0();
    LOBYTE(v12) = 7;
    sub_100032D10();
    LOBYTE(v12) = 8;
    sub_100032CF0();
    LOBYTE(v12) = 9;
    sub_100032CF0();
    LOBYTE(v12) = 10;
    sub_100032CF0();
    LOBYTE(v12) = 11;
    sub_100032CF0();
    LOBYTE(v12) = 12;
    sub_100032CF0();
    LOBYTE(v12) = 13;
    sub_100032CF0();
    LOBYTE(v12) = 14;
    sub_100032D10();
    LOBYTE(v12) = 15;
    sub_100032CF0();
    LOBYTE(v12) = 16;
    sub_100032CF0();
    LOBYTE(v12) = 17;
    sub_100032CF0();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 88));
    HIBYTE(v11) = 18;
    sub_10000CE90(&qword_1000433A0);
    sub_100018E5C(&qword_1000433D0, (void (*)(void))sub_100018ECC);
    sub_100032D30();
    LOBYTE(v12) = 19;
    sub_100032D00();
    LOBYTE(v12) = 20;
    sub_100032D00();
    LOBYTE(v12) = 21;
    sub_100032CF0();
    LOBYTE(v12) = 22;
    sub_100032D40();
    LOBYTE(v12) = 23;
    sub_100032CF0();
    LOBYTE(v12) = 24;
    sub_100032CF0();
    LOBYTE(v12) = 25;
    sub_100032CF0();
    LOBYTE(v12) = 26;
    sub_100032CF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100015B34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v124 = a2;
  uint64_t v3 = sub_10000CE90(&qword_100043128);
  __chkstk_darwin(v3 - 8);
  uint64_t v126 = (char *)&v122 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000CE90(&qword_100043130);
  __chkstk_darwin(v5 - 8);
  uint64_t v128 = (char *)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_10000CE90(&qword_100043380);
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v153 = (char *)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v8 = (int *)type metadata accessor for SMSDictionary();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v122 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (uint64_t)&v11[*(int *)(v9 + 20)];
  uint64_t v13 = sub_100032180();
  char v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v152 = v12;
  uint64_t v127 = v13;
  v14(v12, 1, 1);
  uint64_t v149 = v8[8];
  *(void *)&v11[v149] = 0;
  uint64_t v15 = (uint64_t)&v11[v8[9]];
  uint64_t v16 = sub_100031F70();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v150 = v15;
  uint64_t v125 = v16;
  v17(v15, 1, 1);
  unint64_t v18 = &v11[v8[10]];
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  uint64_t v151 = v18;
  unint64_t v19 = &v11[v8[11]];
  *(void *)unint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = &v11[v8[12]];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v148 = v20;
  uint64_t v21 = &v11[v8[13]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v146 = v21;
  uint64_t v22 = &v11[v8[14]];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  v145 = v22;
  uint64_t v23 = &v11[v8[15]];
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = 0;
  char v144 = v23;
  uint64_t v24 = &v11[v8[16]];
  *(void *)uint64_t v24 = 0;
  *((void *)v24 + 1) = 0;
  uint64_t v143 = v24;
  uint64_t v25 = &v11[v8[17]];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  uint64_t v142 = v25;
  uint64_t v26 = &v11[v8[18]];
  *(void *)uint64_t v26 = 0;
  v26[8] = 1;
  unint64_t v27 = &v11[v8[19]];
  *(void *)unint64_t v27 = 0;
  *((void *)v27 + 1) = 0;
  uint64_t v138 = v27;
  uint64_t v28 = &v11[v8[20]];
  *(void *)uint64_t v28 = 0;
  *((void *)v28 + 1) = 0;
  char v137 = v28;
  uint64_t v29 = &v11[v8[21]];
  *(void *)uint64_t v29 = 0;
  *((void *)v29 + 1) = 0;
  uint64_t v136 = v29;
  uint64_t v139 = v8[22];
  *(void *)&v11[v139] = 0;
  uint64_t v30 = v8[23];
  v11[v30] = 2;
  uint64_t v31 = v8[24];
  v11[v31] = 2;
  uint64_t v32 = &v11[v8[25]];
  *(void *)uint64_t v32 = 0;
  *((void *)v32 + 1) = 0;
  unint64_t v135 = v32;
  uint64_t v33 = &v11[v8[26]];
  *(void *)uint64_t v33 = 0;
  v33[8] = 1;
  uint64_t v34 = &v11[v8[27]];
  *(void *)uint64_t v34 = 0;
  *((void *)v34 + 1) = 0;
  uint64_t v134 = v34;
  uint64_t v35 = &v11[v8[28]];
  *(void *)uint64_t v35 = 0;
  *((void *)v35 + 1) = 0;
  uint64_t v133 = v35;
  uint64_t v36 = &v11[v8[29]];
  *(void *)uint64_t v36 = 0;
  *((void *)v36 + 1) = 0;
  uint64_t v132 = v36;
  char v147 = v8;
  uint64_t v37 = &v11[v8[30]];
  *(void *)uint64_t v37 = 0;
  *((void *)v37 + 1) = 0;
  uint64_t v140 = v37;
  uint64_t v141 = a1;
  sub_1000110D0(a1, a1[3]);
  sub_100018D08();
  long long v38 = v131;
  sub_100032E10();
  if (v38)
  {
    uint64_t v40 = v150;
    sub_1000136B4((uint64_t)v141);
    sub_10000F0CC(v152, &qword_100043130);
    swift_bridgeObjectRelease();
    sub_10000F0CC(v40, &qword_100043128);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = (uint64_t)v128;
    uint64_t v131 = (uint64_t *)v19;
    uint64_t v123 = v30;
    uint64_t v122 = (uint64_t *)v33;
    LOBYTE(v155) = 0;
    *(void *)uint64_t v11 = sub_100032CA0();
    v11[8] = v41 & 1;
    LOBYTE(v155) = 1;
    sub_100018E14(&qword_100043390, (void (*)(uint64_t))&type metadata accessor for SMSMessage.FilterSubCategoryType);
    sub_100032CC0();
    uint64_t v42 = v147;
    sub_100018D5C(v39, v152, &qword_100043130);
    LOBYTE(v155) = 2;
    uint64_t v43 = sub_100032CE0();
    uint64_t v44 = (uint64_t *)&v11[v42[6]];
    *uint64_t v44 = v43;
    v44[1] = v45;
    LOBYTE(v155) = 3;
    uint64_t v46 = sub_100032CE0();
    uint64_t v47 = v149;
    unint64_t v48 = (uint64_t *)&v11[v42[7]];
    uint64_t *v48 = v46;
    v48[1] = v49;
    sub_10000CE90(&qword_1000431F0);
    char v154 = 4;
    sub_100013704(&qword_100043230);
    sub_100032CC0();
    uint64_t v50 = v155;
    swift_bridgeObjectRelease();
    *(void *)&v11[v47] = v50;
    LOBYTE(v155) = 5;
    sub_100018E14(&qword_100043398, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v51 = (uint64_t)v126;
    sub_100032CC0();
    sub_100018D5C(v51, v150, &qword_100043128);
    LOBYTE(v155) = 6;
    uint64_t v52 = sub_100032C80();
    uint64_t v53 = (uint64_t *)v151;
    uint64_t v128 = v54;
    swift_bridgeObjectRelease();
    unint64_t v55 = v128;
    *uint64_t v53 = v52;
    v53[1] = (uint64_t)v55;
    LOBYTE(v155) = 7;
    uint64_t v56 = sub_100032CA0();
    uint64_t v57 = v131;
    uint64_t *v131 = v56;
    *((unsigned char *)v57 + 8) = v58 & 1;
    LOBYTE(v155) = 8;
    uint64_t v59 = sub_100032C80();
    uint64_t v61 = v60;
    uint64_t v62 = (uint64_t *)v148;
    swift_bridgeObjectRelease();
    *uint64_t v62 = v59;
    v62[1] = v61;
    LOBYTE(v155) = 9;
    uint64_t v63 = sub_100032C80();
    uint64_t v65 = v64;
    uint64_t v66 = (uint64_t *)v146;
    swift_bridgeObjectRelease();
    *uint64_t v66 = v63;
    v66[1] = v65;
    LOBYTE(v155) = 10;
    uint64_t v67 = sub_100032C80();
    uint64_t v69 = v68;
    uint64_t v70 = (uint64_t *)v145;
    swift_bridgeObjectRelease();
    *uint64_t v70 = v67;
    v70[1] = v69;
    LOBYTE(v155) = 11;
    uint64_t v71 = sub_100032C80();
    uint64_t v73 = v72;
    uint64_t v74 = (uint64_t *)v144;
    swift_bridgeObjectRelease();
    *uint64_t v74 = v71;
    v74[1] = v73;
    LOBYTE(v155) = 12;
    uint64_t v75 = sub_100032C80();
    uint64_t v77 = v76;
    uint64_t v78 = (uint64_t *)v143;
    swift_bridgeObjectRelease();
    *uint64_t v78 = v75;
    v78[1] = v77;
    LOBYTE(v155) = 13;
    uint64_t v79 = sub_100032C80();
    uint64_t v81 = v80;
    uint64_t v82 = (uint64_t *)v142;
    swift_bridgeObjectRelease();
    *uint64_t v82 = v79;
    v82[1] = v81;
    LOBYTE(v155) = 14;
    *(void *)uint64_t v26 = sub_100032CA0();
    v26[8] = v83 & 1;
    LOBYTE(v155) = 15;
    uint64_t v84 = sub_100032C80();
    uint64_t v86 = v85;
    uint64_t v87 = (uint64_t *)v138;
    swift_bridgeObjectRelease();
    *uint64_t v87 = v84;
    v87[1] = v86;
    LOBYTE(v155) = 16;
    uint64_t v88 = sub_100032C80();
    uint64_t v90 = v89;
    uint64_t v91 = (uint64_t *)v137;
    swift_bridgeObjectRelease();
    uint64_t *v91 = v88;
    v91[1] = v90;
    LOBYTE(v155) = 17;
    uint64_t v92 = sub_100032C80();
    uint64_t v94 = v93;
    uint64_t v95 = (uint64_t *)v136;
    swift_bridgeObjectRelease();
    *uint64_t v95 = v92;
    v95[1] = v94;
    sub_10000CE90(&qword_1000433A0);
    char v154 = 18;
    sub_100018E5C(&qword_1000433A8, (void (*)(void))sub_100018DC0);
    sub_100032CC0();
    uint64_t v96 = v155;
    uint64_t v97 = v139;
    swift_bridgeObjectRelease();
    *(void *)&v11[v97] = v96;
    LOBYTE(v155) = 19;
    v11[v123] = sub_100032C90();
    LOBYTE(v155) = 20;
    v11[v31] = sub_100032C90();
    LOBYTE(v155) = 21;
    uint64_t v98 = sub_100032C80();
    uint64_t v100 = v99;
    uint64_t v101 = (uint64_t *)v135;
    swift_bridgeObjectRelease();
    *uint64_t v101 = v98;
    v101[1] = v100;
    LOBYTE(v155) = 22;
    uint64_t v102 = sub_100032CD0();
    uint64_t v103 = v122;
    *uint64_t v122 = v102;
    *((unsigned char *)v103 + 8) = v104 & 1;
    LOBYTE(v155) = 23;
    uint64_t v105 = sub_100032C80();
    uint64_t v107 = v106;
    uint64_t v108 = (uint64_t *)v134;
    swift_bridgeObjectRelease();
    *uint64_t v108 = v105;
    v108[1] = v107;
    LOBYTE(v155) = 24;
    uint64_t v109 = sub_100032C80();
    uint64_t v111 = v110;
    int v112 = (uint64_t *)v133;
    swift_bridgeObjectRelease();
    *int v112 = v109;
    v112[1] = v111;
    LOBYTE(v155) = 25;
    uint64_t v113 = sub_100032C80();
    uint64_t v115 = v114;
    uint64_t v116 = (uint64_t *)v132;
    swift_bridgeObjectRelease();
    *uint64_t v116 = v113;
    v116[1] = v115;
    LOBYTE(v155) = 26;
    uint64_t v117 = sub_100032C80();
    uint64_t v119 = v118;
    (*(void (**)(char *, uint64_t))(v129 + 8))(v153, v130);
    uint64_t v120 = (uint64_t *)v140;
    swift_bridgeObjectRelease();
    *uint64_t v120 = v117;
    v120[1] = v119;
    sub_100015318((uint64_t)v11, v124);
    sub_1000136B4((uint64_t)v141);
    return sub_10000EF14((uint64_t)v11);
  }
}

uint64_t sub_1000169A0(char a1)
{
  uint64_t result = 109;
  switch(a1)
  {
    case 1:
      uint64_t result = 1668510559;
      break;
    case 2:
      uint64_t result = 22131;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = 25970;
      break;
    case 5:
      uint64_t result = 119;
      break;
    case 6:
      uint64_t result = 104;
      break;
    case 7:
      uint64_t result = 25449;
      break;
    case 8:
      uint64_t result = 99;
      break;
    case 9:
      uint64_t result = 28515;
      break;
    case 10:
      uint64_t result = 25955;
      break;
    case 11:
      uint64_t result = 29539;
      break;
    case 12:
      uint64_t result = 97;
      break;
    case 13:
      uint64_t result = 98;
      break;
    case 14:
      uint64_t result = 108;
      break;
    case 15:
      uint64_t result = 110;
      break;
    case 16:
      uint64_t result = 103;
      break;
    case 17:
      uint64_t result = 26726;
      break;
    case 18:
      uint64_t result = 107;
      break;
    case 19:
      uint64_t result = 25453;
      break;
    case 20:
      uint64_t result = 114;
      break;
    case 21:
      uint64_t result = 7234918;
      break;
    case 22:
      uint64_t result = 7299942;
      break;
    case 23:
      uint64_t result = 1145664868;
      break;
    case 24:
      uint64_t result = 7234659;
      break;
    case 25:
      uint64_t result = 6907747;
      break;
    case 26:
      uint64_t result = 1768383343;
      break;
    default:
      uint64_t result = 6517599;
      break;
  }
  return result;
}

uint64_t sub_100016B70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100015B34(a1, a2);
}

uint64_t sub_100016B88(void *a1)
{
  return sub_1000153E4(a1);
}

uint64_t sub_100016BA0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_1000169A0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000169A0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100032D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100016C2C()
{
  char v1 = *v0;
  sub_100032DE0();
  sub_1000169A0(v1);
  sub_1000328E0();
  swift_bridgeObjectRelease();
  return sub_100032E00();
}

uint64_t sub_100016C90()
{
  sub_1000169A0(*v0);
  sub_1000328E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100016CE4()
{
  char v1 = *v0;
  sub_100032DE0();
  sub_1000169A0(v1);
  sub_1000328E0();
  swift_bridgeObjectRelease();
  return sub_100032E00();
}

uint64_t sub_100016D44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000191BC();
  *a1 = result;
  return result;
}

uint64_t sub_100016D74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000169A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100016DA0()
{
  return sub_1000169A0(*v0);
}

uint64_t sub_100016DA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000191BC();
  *a1 = result;
  return result;
}

void sub_100016DD0(unsigned char *a1@<X8>)
{
  *a1 = 27;
}

uint64_t sub_100016DDC(uint64_t a1)
{
  unint64_t v2 = sub_100018D08();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100016E18(uint64_t a1)
{
  unint64_t v2 = sub_100018D08();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100016E54(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = a3[5];
    char v8 = (void *)(a1 + v7);
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100032180();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_10000CE90(&qword_100043130);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (void *)((char *)v4 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    unint64_t v19 = (void *)((char *)v4 + v15);
    uint64_t v20 = (uint64_t *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    *unint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[9];
    *(void *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    __dst = (char *)v4 + v22;
    uint64_t v23 = (char *)a2 + v22;
    uint64_t v24 = sub_100031F70();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v96 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v96(v23, 1, v24))
    {
      uint64_t v26 = sub_10000CE90(&qword_100043128);
      memcpy(__dst, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(__dst, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
    }
    uint64_t v27 = a3[10];
    uint64_t v28 = a3[11];
    uint64_t v29 = (void *)((char *)v4 + v27);
    uint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = (char *)v4 + v28;
    uint64_t v33 = (uint64_t)a2 + v28;
    *(void *)uint64_t v32 = *(void *)v33;
    v32[8] = *(unsigned char *)(v33 + 8);
    uint64_t v34 = a3[12];
    uint64_t v35 = a3[13];
    uint64_t v36 = (void *)((char *)v4 + v34);
    uint64_t v37 = (uint64_t *)((char *)a2 + v34);
    uint64_t v97 = v37[1];
    void *v36 = *v37;
    v36[1] = v97;
    long long v38 = (void *)((char *)v4 + v35);
    uint64_t v39 = (uint64_t *)((char *)a2 + v35);
    __dsta = (void *)v39[1];
    *long long v38 = *v39;
    v38[1] = __dsta;
    uint64_t v40 = a3[14];
    uint64_t v41 = a3[15];
    uint64_t v42 = (void *)((char *)v4 + v40);
    uint64_t v43 = (uint64_t *)((char *)a2 + v40);
    uint64_t v94 = v43[1];
    void *v42 = *v43;
    v42[1] = v94;
    uint64_t v44 = (void *)((char *)v4 + v41);
    uint64_t v45 = (uint64_t *)((char *)a2 + v41);
    uint64_t v95 = v45[1];
    *uint64_t v44 = *v45;
    v44[1] = v95;
    uint64_t v46 = a3[16];
    uint64_t v47 = a3[17];
    unint64_t v48 = (void *)((char *)v4 + v46);
    uint64_t v49 = (uint64_t *)((char *)a2 + v46);
    uint64_t v92 = v49[1];
    void *v48 = *v49;
    v48[1] = v92;
    uint64_t v50 = (void *)((char *)v4 + v47);
    uint64_t v51 = (uint64_t *)((char *)a2 + v47);
    uint64_t v93 = v51[1];
    *uint64_t v50 = *v51;
    v50[1] = v93;
    uint64_t v52 = a3[18];
    uint64_t v53 = a3[19];
    uint64_t v54 = (char *)v4 + v52;
    uint64_t v55 = (uint64_t)a2 + v52;
    *(void *)uint64_t v54 = *(void *)v55;
    v54[8] = *(unsigned char *)(v55 + 8);
    uint64_t v56 = (void *)((char *)v4 + v53);
    uint64_t v57 = (uint64_t *)((char *)a2 + v53);
    uint64_t v91 = v57[1];
    *uint64_t v56 = *v57;
    v56[1] = v91;
    uint64_t v58 = a3[20];
    uint64_t v59 = a3[21];
    uint64_t v60 = (void *)((char *)v4 + v58);
    uint64_t v61 = (uint64_t *)((char *)a2 + v58);
    uint64_t v62 = v61[1];
    void *v60 = *v61;
    v60[1] = v62;
    uint64_t v63 = (void *)((char *)v4 + v59);
    uint64_t v64 = (uint64_t *)((char *)a2 + v59);
    uint64_t v65 = v64[1];
    void *v63 = *v64;
    v63[1] = v65;
    uint64_t v66 = a3[23];
    *(void *)((char *)v4 + a3[22]) = *(uint64_t *)((char *)a2 + a3[22]);
    *((unsigned char *)v4 + v66) = *((unsigned char *)a2 + v66);
    uint64_t v67 = a3[25];
    *((unsigned char *)v4 + a3[24]) = *((unsigned char *)a2 + a3[24]);
    uint64_t v68 = (void *)((char *)v4 + v67);
    uint64_t v69 = (uint64_t *)((char *)a2 + v67);
    uint64_t v70 = v69[1];
    *uint64_t v68 = *v69;
    v68[1] = v70;
    uint64_t v71 = a3[26];
    uint64_t v72 = a3[27];
    uint64_t v73 = (char *)v4 + v71;
    uint64_t v74 = (uint64_t)a2 + v71;
    *(void *)uint64_t v73 = *(void *)v74;
    v73[8] = *(unsigned char *)(v74 + 8);
    uint64_t v75 = (void *)((char *)v4 + v72);
    uint64_t v76 = (uint64_t *)((char *)a2 + v72);
    uint64_t v77 = v76[1];
    *uint64_t v75 = *v76;
    v75[1] = v77;
    uint64_t v78 = a3[28];
    uint64_t v79 = a3[29];
    uint64_t v80 = (void *)((char *)v4 + v78);
    uint64_t v81 = (uint64_t *)((char *)a2 + v78);
    uint64_t v82 = v81[1];
    void *v80 = *v81;
    v80[1] = v82;
    char v83 = (void *)((char *)v4 + v79);
    uint64_t v84 = (uint64_t *)((char *)a2 + v79);
    uint64_t v85 = v84[1];
    *char v83 = *v84;
    v83[1] = v85;
    uint64_t v86 = a3[30];
    uint64_t v87 = (void *)((char *)v4 + v86);
    uint64_t v88 = (uint64_t *)((char *)a2 + v86);
    uint64_t v89 = v88[1];
    *uint64_t v87 = *v88;
    v87[1] = v89;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100017324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100032180();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 36);
  uint64_t v8 = sub_100031F70();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100017598(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100032180();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_10000CE90(&qword_100043130);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  __dst = (void *)(a1 + v20);
  uint64_t v21 = (const void *)(a2 + v20);
  uint64_t v22 = sub_100031F70();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v94 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v94(v21, 1, v22))
  {
    uint64_t v24 = sub_10000CE90(&qword_100043128);
    memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(__dst, v21, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
  }
  uint64_t v25 = a3[10];
  uint64_t v26 = a3[11];
  uint64_t v27 = (void *)(a1 + v25);
  uint64_t v28 = (void *)(a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = a1 + v26;
  uint64_t v31 = a2 + v26;
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  uint64_t v32 = a3[12];
  uint64_t v33 = a3[13];
  uint64_t v34 = (void *)(a1 + v32);
  uint64_t v35 = (void *)(a2 + v32);
  uint64_t v95 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v95;
  uint64_t v36 = (void *)(a1 + v33);
  uint64_t v37 = (void *)(a2 + v33);
  __dsta = (void *)v37[1];
  void *v36 = *v37;
  v36[1] = __dsta;
  uint64_t v38 = a3[14];
  uint64_t v39 = a3[15];
  uint64_t v40 = (void *)(a1 + v38);
  uint64_t v41 = (void *)(a2 + v38);
  uint64_t v92 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v92;
  uint64_t v42 = (void *)(a1 + v39);
  uint64_t v43 = (void *)(a2 + v39);
  uint64_t v93 = v43[1];
  void *v42 = *v43;
  v42[1] = v93;
  uint64_t v44 = a3[16];
  uint64_t v45 = a3[17];
  uint64_t v46 = (void *)(a1 + v44);
  uint64_t v47 = (void *)(a2 + v44);
  uint64_t v90 = v47[1];
  *uint64_t v46 = *v47;
  v46[1] = v90;
  unint64_t v48 = (void *)(a1 + v45);
  uint64_t v49 = (void *)(a2 + v45);
  uint64_t v91 = v49[1];
  void *v48 = *v49;
  v48[1] = v91;
  uint64_t v50 = a3[18];
  uint64_t v51 = a3[19];
  uint64_t v52 = a1 + v50;
  uint64_t v53 = a2 + v50;
  *(void *)uint64_t v52 = *(void *)v53;
  *(unsigned char *)(v52 + 8) = *(unsigned char *)(v53 + 8);
  uint64_t v54 = (void *)(a1 + v51);
  uint64_t v55 = (void *)(a2 + v51);
  uint64_t v89 = v55[1];
  *uint64_t v54 = *v55;
  v54[1] = v89;
  uint64_t v56 = a3[20];
  uint64_t v57 = a3[21];
  uint64_t v58 = (void *)(a1 + v56);
  uint64_t v59 = (void *)(a2 + v56);
  uint64_t v60 = v59[1];
  void *v58 = *v59;
  v58[1] = v60;
  uint64_t v61 = (void *)(a1 + v57);
  uint64_t v62 = (void *)(a2 + v57);
  uint64_t v63 = v62[1];
  *uint64_t v61 = *v62;
  v61[1] = v63;
  uint64_t v64 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  *(unsigned char *)(a1 + v64) = *(unsigned char *)(a2 + v64);
  uint64_t v65 = a3[25];
  *(unsigned char *)(a1 + a3[24]) = *(unsigned char *)(a2 + a3[24]);
  uint64_t v66 = (void *)(a1 + v65);
  uint64_t v67 = (void *)(a2 + v65);
  uint64_t v68 = v67[1];
  *uint64_t v66 = *v67;
  v66[1] = v68;
  uint64_t v69 = a3[26];
  uint64_t v70 = a3[27];
  uint64_t v71 = a1 + v69;
  uint64_t v72 = a2 + v69;
  *(void *)uint64_t v71 = *(void *)v72;
  *(unsigned char *)(v71 + 8) = *(unsigned char *)(v72 + 8);
  uint64_t v73 = (void *)(a1 + v70);
  uint64_t v74 = (void *)(a2 + v70);
  uint64_t v75 = v74[1];
  void *v73 = *v74;
  v73[1] = v75;
  uint64_t v76 = a3[28];
  uint64_t v77 = a3[29];
  uint64_t v78 = (void *)(a1 + v76);
  uint64_t v79 = (void *)(a2 + v76);
  uint64_t v80 = v79[1];
  *uint64_t v78 = *v79;
  v78[1] = v80;
  uint64_t v81 = (void *)(a1 + v77);
  uint64_t v82 = (void *)(a2 + v77);
  uint64_t v83 = v82[1];
  *uint64_t v81 = *v82;
  v81[1] = v83;
  uint64_t v84 = a3[30];
  uint64_t v85 = (void *)(a1 + v84);
  uint64_t v86 = (void *)(a2 + v84);
  uint64_t v87 = v86[1];
  *uint64_t v85 = *v86;
  v85[1] = v87;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100017A18(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100032180();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_10000CE90(&qword_100043130);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = sub_100031F70();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, char *, uint64_t))(v26 + 24))(v23, v24, v25);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    uint64_t v30 = sub_10000CE90(&qword_100043128);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_13:
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (uint64_t *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[11];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = (uint64_t *)((char *)a2 + v34);
  uint64_t v37 = *v36;
  *(unsigned char *)(v35 + 8) = *((unsigned char *)v36 + 8);
  *(void *)uint64_t v35 = v37;
  uint64_t v38 = a3[12];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (uint64_t *)((char *)a2 + v38);
  void *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[13];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (uint64_t *)((char *)a2 + v41);
  void *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = a3[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (uint64_t *)((char *)a2 + v44);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[15];
  unint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (uint64_t *)((char *)a2 + v47);
  void *v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[16];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (uint64_t *)((char *)a2 + v50);
  void *v51 = *v52;
  v51[1] = v52[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v53 = a3[17];
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (uint64_t *)((char *)a2 + v53);
  *uint64_t v54 = *v55;
  v54[1] = v55[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v56 = a3[18];
  uint64_t v57 = a1 + v56;
  uint64_t v58 = (uint64_t *)((char *)a2 + v56);
  uint64_t v59 = *v58;
  *(unsigned char *)(v57 + 8) = *((unsigned char *)v58 + 8);
  *(void *)uint64_t v57 = v59;
  uint64_t v60 = a3[19];
  uint64_t v61 = (void *)(a1 + v60);
  uint64_t v62 = (uint64_t *)((char *)a2 + v60);
  *uint64_t v61 = *v62;
  v61[1] = v62[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v63 = a3[20];
  uint64_t v64 = (void *)(a1 + v63);
  uint64_t v65 = (uint64_t *)((char *)a2 + v63);
  *uint64_t v64 = *v65;
  v64[1] = v65[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v66 = a3[21];
  uint64_t v67 = (void *)(a1 + v66);
  uint64_t v68 = (uint64_t *)((char *)a2 + v66);
  *uint64_t v67 = *v68;
  v67[1] = v68[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[22]) = *(uint64_t *)((char *)a2 + a3[22]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[23]) = *((unsigned char *)a2 + a3[23]);
  *(unsigned char *)(a1 + a3[24]) = *((unsigned char *)a2 + a3[24]);
  uint64_t v69 = a3[25];
  uint64_t v70 = (void *)(a1 + v69);
  uint64_t v71 = (uint64_t *)((char *)a2 + v69);
  *uint64_t v70 = *v71;
  v70[1] = v71[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v72 = a3[26];
  uint64_t v73 = a1 + v72;
  uint64_t v74 = (uint64_t *)((char *)a2 + v72);
  uint64_t v75 = *v74;
  *(unsigned char *)(v73 + 8) = *((unsigned char *)v74 + 8);
  *(void *)uint64_t v73 = v75;
  uint64_t v76 = a3[27];
  uint64_t v77 = (void *)(a1 + v76);
  uint64_t v78 = (uint64_t *)((char *)a2 + v76);
  *uint64_t v77 = *v78;
  v77[1] = v78[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v79 = a3[28];
  uint64_t v80 = (void *)(a1 + v79);
  uint64_t v81 = (uint64_t *)((char *)a2 + v79);
  void *v80 = *v81;
  v80[1] = v81[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v82 = a3[29];
  uint64_t v83 = (void *)(a1 + v82);
  uint64_t v84 = (uint64_t *)((char *)a2 + v82);
  *uint64_t v83 = *v84;
  v83[1] = v84[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v85 = a3[30];
  uint64_t v86 = (void *)(a1 + v85);
  uint64_t v87 = (uint64_t *)((char *)a2 + v85);
  *uint64_t v86 = *v87;
  v86[1] = v87[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001806C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100032180();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_10000CE90(&qword_100043130);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  int v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_100031F70();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_10000CE90(&qword_100043128);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  uint64_t v22 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  uint64_t v23 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v23) = *(_OWORD *)(a2 + v23);
  uint64_t v24 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v24) = *(_OWORD *)(a2 + v24);
  uint64_t v25 = a3[18];
  uint64_t v26 = a3[19];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  uint64_t v29 = a3[21];
  *(_OWORD *)(a1 + a3[20]) = *(_OWORD *)(a2 + a3[20]);
  *(_OWORD *)(a1 + v29) = *(_OWORD *)(a2 + v29);
  uint64_t v30 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v31 = a3[25];
  *(unsigned char *)(a1 + a3[24]) = *(unsigned char *)(a2 + a3[24]);
  *(_OWORD *)(a1 + v31) = *(_OWORD *)(a2 + v31);
  uint64_t v32 = a3[26];
  uint64_t v33 = a3[27];
  uint64_t v34 = a1 + v32;
  uint64_t v35 = a2 + v32;
  *(void *)uint64_t v34 = *(void *)v35;
  *(unsigned char *)(v34 + 8) = *(unsigned char *)(v35 + 8);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  uint64_t v36 = a3[29];
  *(_OWORD *)(a1 + a3[28]) = *(_OWORD *)(a2 + a3[28]);
  *(_OWORD *)(a1 + v36) = *(_OWORD *)(a2 + v36);
  *(_OWORD *)(a1 + a3[30]) = *(_OWORD *)(a2 + a3[30]);
  return a1;
}

uint64_t sub_100018390(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_100032180();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_10000CE90(&qword_100043130);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  uint64_t v28 = sub_100031F70();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v26, v27, v28);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v29 + 8))(v26, v28);
    goto LABEL_12;
  }
  if (v32)
  {
LABEL_12:
    uint64_t v33 = sub_10000CE90(&qword_100043128);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v26, v27, v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_13:
  uint64_t v34 = a3[10];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  void *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[11];
  uint64_t v40 = a3[12];
  uint64_t v41 = a1 + v39;
  uint64_t v42 = a2 + v39;
  *(void *)uint64_t v41 = *(void *)v42;
  *(unsigned char *)(v41 + 8) = *(unsigned char *)(v42 + 8);
  uint64_t v43 = (void *)(a1 + v40);
  uint64_t v44 = (uint64_t *)(a2 + v40);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  void *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[13];
  unint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (uint64_t *)(a2 + v47);
  uint64_t v51 = *v49;
  uint64_t v50 = v49[1];
  void *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  uint64_t v52 = a3[14];
  uint64_t v53 = (void *)(a1 + v52);
  uint64_t v54 = (uint64_t *)(a2 + v52);
  uint64_t v56 = *v54;
  uint64_t v55 = v54[1];
  *uint64_t v53 = v56;
  v53[1] = v55;
  swift_bridgeObjectRelease();
  uint64_t v57 = a3[15];
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[16];
  uint64_t v63 = (void *)(a1 + v62);
  uint64_t v64 = (uint64_t *)(a2 + v62);
  uint64_t v66 = *v64;
  uint64_t v65 = v64[1];
  void *v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  uint64_t v67 = a3[17];
  uint64_t v68 = (void *)(a1 + v67);
  uint64_t v69 = (uint64_t *)(a2 + v67);
  uint64_t v71 = *v69;
  uint64_t v70 = v69[1];
  *uint64_t v68 = v71;
  v68[1] = v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = a3[18];
  uint64_t v73 = a3[19];
  uint64_t v74 = a1 + v72;
  uint64_t v75 = a2 + v72;
  *(void *)uint64_t v74 = *(void *)v75;
  *(unsigned char *)(v74 + 8) = *(unsigned char *)(v75 + 8);
  uint64_t v76 = (void *)(a1 + v73);
  uint64_t v77 = (uint64_t *)(a2 + v73);
  uint64_t v79 = *v77;
  uint64_t v78 = v77[1];
  *uint64_t v76 = v79;
  v76[1] = v78;
  swift_bridgeObjectRelease();
  uint64_t v80 = a3[20];
  uint64_t v81 = (void *)(a1 + v80);
  uint64_t v82 = (uint64_t *)(a2 + v80);
  uint64_t v84 = *v82;
  uint64_t v83 = v82[1];
  *uint64_t v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  uint64_t v85 = a3[21];
  uint64_t v86 = (void *)(a1 + v85);
  uint64_t v87 = (uint64_t *)(a2 + v85);
  uint64_t v89 = *v87;
  uint64_t v88 = v87[1];
  *uint64_t v86 = v89;
  v86[1] = v88;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  swift_bridgeObjectRelease();
  uint64_t v90 = a3[24];
  *(unsigned char *)(a1 + a3[23]) = *(unsigned char *)(a2 + a3[23]);
  *(unsigned char *)(a1 + v90) = *(unsigned char *)(a2 + v90);
  uint64_t v91 = a3[25];
  uint64_t v92 = (void *)(a1 + v91);
  uint64_t v93 = (uint64_t *)(a2 + v91);
  uint64_t v95 = *v93;
  uint64_t v94 = v93[1];
  *uint64_t v92 = v95;
  v92[1] = v94;
  swift_bridgeObjectRelease();
  uint64_t v96 = a3[26];
  uint64_t v97 = a3[27];
  uint64_t v98 = a1 + v96;
  uint64_t v99 = a2 + v96;
  *(void *)uint64_t v98 = *(void *)v99;
  *(unsigned char *)(v98 + 8) = *(unsigned char *)(v99 + 8);
  uint64_t v100 = (void *)(a1 + v97);
  uint64_t v101 = (uint64_t *)(a2 + v97);
  uint64_t v103 = *v101;
  uint64_t v102 = v101[1];
  *uint64_t v100 = v103;
  v100[1] = v102;
  swift_bridgeObjectRelease();
  uint64_t v104 = a3[28];
  uint64_t v105 = (void *)(a1 + v104);
  uint64_t v106 = (uint64_t *)(a2 + v104);
  uint64_t v108 = *v106;
  uint64_t v107 = v106[1];
  *uint64_t v105 = v108;
  v105[1] = v107;
  swift_bridgeObjectRelease();
  uint64_t v109 = a3[29];
  uint64_t v110 = (void *)(a1 + v109);
  uint64_t v111 = (uint64_t *)(a2 + v109);
  uint64_t v113 = *v111;
  uint64_t v112 = v111[1];
  *uint64_t v110 = v113;
  v110[1] = v112;
  swift_bridgeObjectRelease();
  uint64_t v114 = a3[30];
  uint64_t v115 = (void *)(a1 + v114);
  uint64_t v116 = (uint64_t *)(a2 + v114);
  uint64_t v118 = *v116;
  uint64_t v117 = v116[1];
  *uint64_t v115 = v118;
  v115[1] = v117;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000188B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000188C8);
}

uint64_t sub_1000188C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000CE90(&qword_100043130);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = sub_10000CE90(&qword_100043128);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[9];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_100018A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018A18);
}

uint64_t sub_100018A18(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_10000CE90(&qword_100043130);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = sub_10000CE90(&qword_100043128);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_100018B54()
{
  sub_100018CB4(319, &qword_1000432E0, (void (*)(uint64_t))&type metadata accessor for SMSMessage.FilterSubCategoryType);
  if (v0 <= 0x3F)
  {
    sub_100018CB4(319, (unint64_t *)&unk_1000432E8, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100018CB4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100032B60();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_100018D08()
{
  unint64_t result = qword_100043388;
  if (!qword_100043388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043388);
  }
  return result;
}

uint64_t sub_100018D5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000CE90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_100018DC0()
{
  unint64_t result = qword_1000433B0;
  if (!qword_1000433B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433B0);
  }
  return result;
}

uint64_t sub_100018E14(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100018E5C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000F020(&qword_1000433A0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100018ECC()
{
  unint64_t result = qword_1000433D8;
  if (!qword_1000433D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SMSDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE6) {
    goto LABEL_17;
  }
  if (a2 + 26 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 26) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 26;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1B;
  int v8 = v6 - 27;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SMSDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 26 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 26) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE5)
  {
    unsigned int v6 = ((a2 - 230) >> 8) + 1;
    *unint64_t result = a2 + 26;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001907CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 26;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SMSDictionary.CodingKeys()
{
  return &type metadata for SMSDictionary.CodingKeys;
}

unint64_t sub_1000190B8()
{
  unint64_t result = qword_1000433E0;
  if (!qword_1000433E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433E0);
  }
  return result;
}

unint64_t sub_100019110()
{
  unint64_t result = qword_1000433E8;
  if (!qword_1000433E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433E8);
  }
  return result;
}

unint64_t sub_100019168()
{
  unint64_t result = qword_1000433F0;
  if (!qword_1000433F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000433F0);
  }
  return result;
}

uint64_t sub_1000191BC()
{
  unint64_t v0 = sub_100032D80();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1B) {
    return 27;
  }
  else {
    return v0;
  }
}

ValueMetadata *type metadata accessor for BasicTextMessageUnpacker()
{
  return &type metadata for BasicTextMessageUnpacker;
}

uint64_t sub_100019220()
{
  return sub_10001D598(&qword_1000433F8, (void (*)(uint64_t))&type metadata accessor for BasicTextMessage);
}

uint64_t sub_100019268@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_100032270();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000CE90(&qword_100043448);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)v25 - v11;
  sub_10000FAE8(v1 + 240, (uint64_t)v29, &qword_100043450);
  sub_10000FAE8((uint64_t)v29, (uint64_t)&v30, &qword_100043450);
  if ((v31 & 1) == 0)
  {
    v25[1] = v30;
    sub_10000FAE8(v1 + 288, (uint64_t)v28, &qword_100043458);
    sub_10000FAE8((uint64_t)v28, (uint64_t)&v32, &qword_100043458);
    if ((v33 & 1) == 0)
    {
      unint64_t v13 = v32;
      sub_10000FAE8(v1 + 304, (uint64_t)v27, &qword_100043460);
      sub_10000FAE8((uint64_t)v27, (uint64_t)&v34, &qword_100043460);
      if ((v35 & 1) == 0)
      {
        unint64_t v14 = v34;
        if (v13 >= 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t result = sub_100031ED0();
        if (v13 != result)
        {
          if (v14 >= 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v16 = v14;
          }
          unint64_t v17 = v13 + v16;
          if (__OFADD__(v13, v16))
          {
            __break(1u);
            return result;
          }
          uint64_t v18 = *(void *)(v1 + 264);
          if (v18)
          {
            v25[0] = *(void *)(v1 + 256);
            swift_bridgeObjectRetain();
            sub_100032250();
            sub_10000FAE8((uint64_t)v12, (uint64_t)v10, &qword_100043448);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) != 1)
            {
              uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
              v20(v6, v10, v3);
              v20(a1, v6, v3);
              sub_10000FAE8(v1 + 320, (uint64_t)v26, &qword_100043178);
              uint64_t v21 = (int *)_s17AssociatedMessageVMa();
              uint64_t v22 = &a1[v21[5]];
              *(void *)uint64_t v22 = v25[0];
              *((void *)v22 + 1) = v18;
              uint64_t v23 = &a1[v21[6]];
              *(void *)uint64_t v23 = 0;
              *((void *)v23 + 1) = 0;
              uint64_t v24 = (unint64_t *)&a1[v21[7]];
              *uint64_t v24 = v13;
              v24[1] = v17;
              sub_10000FAE8((uint64_t)v26, (uint64_t)&a1[v21[8]], &qword_100043178);
              (*(void (**)(char *, void, uint64_t, int *))(*((void *)v21 - 1) + 56))(a1, 0, 1, v21);
              return sub_10001D634((uint64_t)v26);
            }
            swift_bridgeObjectRelease();
            sub_10000F0CC((uint64_t)v10, &qword_100043448);
          }
        }
      }
    }
  }
  uint64_t v19 = _s17AssociatedMessageVMa();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
}

uint64_t sub_1000195EC@<X0>(void (*a1)(uint64_t, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v379 = a2;
  v378 = a1;
  uint64_t v362 = a3;
  uint64_t v3 = sub_10000CE90(&qword_1000431A8);
  __chkstk_darwin(v3 - 8);
  v361 = (char *)&v303 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v368 = sub_100032BE0();
  unint64_t v363 = *(void *)(v368 - 8);
  uint64_t v5 = __chkstk_darwin(v368);
  v360 = (char *)&v303 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  *(void *)&long long v367 = (char *)&v303 - v8;
  __chkstk_darwin(v7);
  v364 = (char *)&v303 - v9;
  uint64_t v10 = sub_10000CE90(&qword_100043170);
  __chkstk_darwin(v10 - 8);
  v339 = (char *)&v303 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000CE90(&qword_100043400);
  __chkstk_darwin(v12 - 8);
  v333 = (char *)&v303 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000324E0();
  uint64_t v334 = *(void *)(v14 - 8);
  uint64_t v335 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  v327 = (char *)&v303 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v332 = (char *)&v303 - v17;
  uint64_t v18 = sub_10000CE90(&qword_100043408);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v326 = (uint64_t)&v303 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v337 = (uint64_t)&v303 - v21;
  uint64_t v348 = sub_100032270();
  uint64_t v344 = *(void *)(v348 - 8);
  uint64_t v22 = __chkstk_darwin(v348);
  v336 = (char *)&v303 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v343 = (char *)&v303 - v24;
  uint64_t v25 = sub_10000CE90(&qword_100043410);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  v342 = (char *)&v303 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v351 = (char *)&v303 - v28;
  uint64_t v29 = _s17AssociatedMessageVMa();
  uint64_t v352 = *(void *)(v29 - 8);
  v353 = (int *)v29;
  __chkstk_darwin(v29);
  uint64_t v354 = (uint64_t)&v303 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100032200();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v355 = v31;
  uint64_t v356 = v32;
  __chkstk_darwin(v31);
  v359 = (char *)&v303 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v365 = sub_100032490();
  uint64_t v366 = *(void *)(v365 - 8);
  uint64_t v34 = __chkstk_darwin(v365);
  uint64_t v370 = (uint64_t)&v303 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  v358 = (char *)&v303 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v330 = (char *)&v303 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v349 = (char *)&v303 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  v340 = (char *)&v303 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v328 = (char *)&v303 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v338 = (char *)&v303 - v47;
  __chkstk_darwin(v46);
  v347 = (char *)&v303 - v48;
  uint64_t v377 = sub_100032790();
  unint64_t v374 = *(void *)(v377 - 8);
  uint64_t v49 = __chkstk_darwin(v377);
  unint64_t v369 = (unint64_t)&v303 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __chkstk_darwin(v49);
  v357 = (char *)&v303 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  v329 = (char *)&v303 - v54;
  uint64_t v55 = __chkstk_darwin(v53);
  v350 = (char *)&v303 - v56;
  uint64_t v57 = __chkstk_darwin(v55);
  v345 = (char *)&v303 - v58;
  uint64_t v59 = __chkstk_darwin(v57);
  v331 = (char *)&v303 - v60;
  uint64_t v61 = __chkstk_darwin(v59);
  v341 = (char *)&v303 - v62;
  uint64_t v63 = __chkstk_darwin(v61);
  v346 = (char *)&v303 - v64;
  __chkstk_darwin(v63);
  *(void *)&long long v376 = (char *)&v303 - v65;
  uint64_t v66 = sub_10000CE90(&qword_100043108);
  __chkstk_darwin(v66 - 8);
  v373 = (char *)&v303 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10000CE90(&qword_100043418);
  __chkstk_darwin(v68 - 8);
  uint64_t v70 = (void (*)(char *, uint64_t))((char *)&v303 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v71 = sub_100032030();
  uint64_t v372 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v73 = (char *)&v303 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1000327C0();
  v371 = *(char **)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v76 = (char *)&v303 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100032070();
  uint64_t v375 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v79 = (char *)&v303 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031F00();
  swift_allocObject();
  uint64_t v80 = sub_100031EF0();
  sub_10001D598(&qword_100043420, (void (*)(uint64_t))&type metadata accessor for TopLevelDictionary);
  uint64_t v81 = v380;
  sub_100031EE0();
  v380 = v81;
  if (v81) {
    return swift_release();
  }
  v322 = v73;
  uint64_t v323 = v71;
  v321 = v70;
  v324 = v76;
  uint64_t v325 = v80;
  v378 = (void (*)(uint64_t, uint64_t))v74;
  uint64_t v379 = v77;
  uint64_t v83 = sub_100032040();
  uint64_t v85 = v79;
  if (v84 >> 60 == 15)
  {
    v371 = (char *)sub_1000101BC();
    uint64_t v372 = sub_100032B20();
    unint64_t v368 = sub_10000CE90(&qword_100043190);
    uint64_t v86 = swift_allocObject();
    long long v367 = xmmword_100037F60;
    *(_OWORD *)(v86 + 16) = xmmword_100037F60;
    uint64_t v87 = v376;
    sub_100032050();
    uint64_t v88 = (uint64_t)v373;
    sub_100032780();
    v378 = *(void (**)(uint64_t, uint64_t))(v374 + 8);
    v378(v87, v377);
    uint64_t v89 = sub_100031FA0();
    uint64_t v90 = *(void *)(v89 - 8);
    unint64_t v374 = *(void *)(v90 + 56);
    v364 = (char *)(v90 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v374)(v88, 0, 1, v89);
    uint64_t v91 = sub_1000326B0();
    uint64_t v93 = v92;
    sub_10000F0CC(v88, &qword_100043108);
    *(void *)(v86 + 56) = &type metadata for String;
    unint64_t v363 = sub_1000101FC();
    *(void *)(v86 + 64) = v363;
    *(void *)(v86 + 32) = v91;
    *(void *)(v86 + 40) = v93;
    sub_100032A70();
    uint64_t v94 = (void *)v372;
    sub_1000320A0();

    swift_bridgeObjectRelease();
    if (sub_100032060())
    {
      uint64_t v95 = (void *)sub_100032B20();
      uint64_t v96 = swift_allocObject();
      *(_OWORD *)(v96 + 16) = v367;
      sub_100032050();
      sub_100032780();
      v378(v87, v377);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v374)(v88, 0, 1, v89);
      uint64_t v97 = sub_1000326B0();
      uint64_t v99 = v98;
      sub_10000F0CC(v88, &qword_100043108);
      unint64_t v100 = v363;
      *(void *)(v96 + 56) = &type metadata for String;
      *(void *)(v96 + 64) = v100;
      *(void *)(v96 + 32) = v97;
      *(void *)(v96 + 40) = v99;
      sub_100032A70();
      sub_1000320A0();

      swift_bridgeObjectRelease();
      sub_10001D544();
      swift_allocError();
      swift_willThrow();
      swift_release();
    }
    else
    {
      uint64_t v110 = v377;
      uint64_t v111 = (void (*)(unint64_t, uint64_t))v378;
      unint64_t v112 = v369;
      sub_100032050();
      uint64_t v113 = v370;
      uint64_t v114 = v380;
      sub_100032570();
      if (!v114)
      {
        (*(void (**)(uint64_t, void, uint64_t))(v366 + 104))(v113, enum case for BasicTextMessage.MessageType.typingIndicator(_:), v365);
        sub_1000324A0();
        (*(void (**)(char *, uint64_t))(v375 + 8))(v85, v379);
        return swift_release();
      }
      swift_release();
      v111(v112, v110);
    }
    uint64_t v115 = *(uint64_t (**)(char *, uint64_t))(v375 + 8);
    uint64_t v116 = v85;
    return v115(v116, v379);
  }
  uint64_t v318 = v83;
  unint64_t v319 = v84;
  Class isa = sub_100031F50().super.isa;
  id v102 = [(objc_class *)isa _imOptionallyDecompressData];

  uint64_t v370 = sub_100031F60();
  unint64_t v104 = v103;

  uint64_t v105 = v324;
  uint64_t v106 = v378;
  uint64_t v107 = (char *)v376;
  unint64_t v108 = (unint64_t)v322;
  v320 = v85;
  unint64_t v369 = v104;
  switch(v104 >> 62)
  {
    case 1uLL:
      LODWORD(v109) = HIDWORD(v370) - v370;
      if (!__OFSUB__(HIDWORD(v370), v370))
      {
        uint64_t v109 = (int)v109;
        goto LABEL_14;
      }
      __break(1u);
      goto LABEL_110;
    case 2uLL:
      uint64_t v118 = *(void *)(v370 + 16);
      uint64_t v117 = *(void *)(v370 + 24);
      BOOL v119 = __OFSUB__(v117, v118);
      uint64_t v109 = v117 - v118;
      if (!v119) {
        goto LABEL_14;
      }
LABEL_110:
      __break(1u);
      goto LABEL_111;
    case 3uLL:
      goto LABEL_18;
    default:
      uint64_t v109 = BYTE6(v104);
LABEL_14:
      if (v109 <= 0)
      {
LABEL_18:
        uint64_t v145 = v323;
        unint64_t v146 = (unint64_t)v322;
        uint64_t v147 = v372;
        (*(void (**)(char *, void, uint64_t))(v372 + 104))(v322, enum case for TopLevelDictionary.CodingKeys.decryptedData(_:), v323);
        sub_100032020();
        (*(void (**)(unint64_t, uint64_t))(v147 + 8))(v146, v145);
        sub_1000327B0();
        sub_1000101BC();
        uint64_t v377 = sub_100032B40();
        sub_10000CE90(&qword_100043190);
        uint64_t v148 = swift_allocObject();
        *(_OWORD *)(v148 + 16) = xmmword_100037F60;
        uint64_t v149 = v371;
        v380 = (char *)*((void *)v371 + 2);
        uint64_t v150 = (uint64_t)v321;
        ((void (*)(void (*)(char *, uint64_t), char *, void (*)(uint64_t, uint64_t)))v380)(v321, v105, v106);
        (*((void (**)(uint64_t, void, uint64_t, void (*)(uint64_t, uint64_t)))v149 + 7))(v150, 0, 1, v106);
        uint64_t v151 = sub_1000326B0();
        uint64_t v153 = v152;
        sub_10000F0CC(v150, &qword_100043418);
        *(void *)(v148 + 56) = &type metadata for String;
        *(void *)(v148 + 64) = sub_1000101FC();
        *(void *)(v148 + 32) = v151;
        *(void *)(v148 + 40) = v153;
        sub_100032A70();
        char v154 = (void *)v377;
        sub_1000320A0();

        swift_bridgeObjectRelease();
        sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        ((void (*)(uint64_t, char *, void (*)(uint64_t, uint64_t)))v380)(v155, v105, v106);
        swift_willThrow();
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v369);
        swift_release();
        (*((void (**)(char *, void))v149 + 1))(v105, v106);
LABEL_34:
        uint64_t v115 = *(uint64_t (**)(char *, uint64_t))(v375 + 8);
        uint64_t v116 = v320;
        return v115(v116, v379);
      }
      sub_10001D5E0();
      uint64_t v120 = (uint64_t)v380;
      sub_100031EE0();
      if (v120)
      {
        v382[0] = v120;
        swift_errorRetain();
        sub_10000CE90(&qword_100043198);
        uint64_t v121 = v364;
        unint64_t v122 = v368;
        if (swift_dynamicCast())
        {
          swift_errorRelease();
          unint64_t v123 = v363;
          uint64_t v124 = v367;
          (*(void (**)(void, char *, unint64_t))(v363 + 32))(v367, v121, v122);
          uint64_t v125 = v372;
          uint64_t v126 = v323;
          (*(void (**)(unint64_t, void, uint64_t))(v372 + 104))(v108, enum case for TopLevelDictionary.CodingKeys.decryptedData(_:), v323);
          sub_100032020();
          (*(void (**)(unint64_t, uint64_t))(v125 + 8))(v108, v126);
          uint64_t v127 = *(void (**)(char *, uint64_t, unint64_t))(v123 + 16);
          v127(v360, v124, v122);
          sub_1000327A0();
          v380 = (char *)sub_1000101BC();
          uint64_t v128 = (void *)sub_100032B40();
          uint64_t v377 = sub_10000CE90(&qword_100043190);
          uint64_t v129 = swift_allocObject();
          long long v376 = xmmword_100037F60;
          *(_OWORD *)(v129 + 16) = xmmword_100037F60;
          uint64_t v130 = (uint64_t)v361;
          v127(v361, v367, v122);
          (*(void (**)(uint64_t, void, uint64_t, unint64_t))(v123 + 56))(v130, 0, 1, v122);
          uint64_t v131 = sub_1000326B0();
          uint64_t v133 = v132;
          sub_10000F0CC(v130, &qword_1000431A8);
          *(void *)(v129 + 56) = &type metadata for String;
          unint64_t v374 = sub_1000101FC();
          *(void *)(v129 + 64) = v374;
          *(void *)(v129 + 32) = v131;
          *(void *)(v129 + 40) = v133;
          sub_100032A70();
          sub_1000320A0();

          swift_bridgeObjectRelease();
          v373 = (char *)sub_100032B40();
          uint64_t v134 = swift_allocObject();
          *(_OWORD *)(v134 + 16) = v376;
          unint64_t v135 = v371;
          v380 = (char *)*((void *)v371 + 2);
          uint64_t v136 = (uint64_t)v321;
          char v137 = v324;
          uint64_t v138 = v378;
          ((void (*)(void (*)(char *, uint64_t), char *, void (*)(uint64_t, uint64_t)))v380)(v321, v324, v378);
          (*((void (**)(uint64_t, void, uint64_t, void (*)(uint64_t, uint64_t)))v135 + 7))(v136, 0, 1, v138);
          uint64_t v139 = sub_1000326B0();
          uint64_t v141 = v140;
          sub_10000F0CC(v136, &qword_100043418);
          unint64_t v142 = v374;
          *(void *)(v134 + 56) = &type metadata for String;
          *(void *)(v134 + 64) = v142;
          *(void *)(v134 + 32) = v139;
          *(void *)(v134 + 40) = v141;
          sub_100032A70();
          uint64_t v143 = v373;
          sub_1000320A0();

          swift_bridgeObjectRelease();
          sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
          swift_allocError();
          ((void (*)(uint64_t, char *, void (*)(uint64_t, uint64_t)))v380)(v144, v137, v138);
          swift_willThrow();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          (*((void (**)(char *, void))v135 + 1))(v137, v138);
          (*(void (**)(void, unint64_t))(v363 + 8))(v367, v368);
          (*(void (**)(char *, uint64_t))(v375 + 8))(v320, v379);
          return swift_errorRelease();
        }
        swift_errorRelease();
        sub_1000101BC();
        v181 = (void *)sub_100032B40();
        sub_10000CE90(&qword_100043190);
        uint64_t v182 = swift_allocObject();
        *(_OWORD *)(v182 + 16) = xmmword_100037F60;
        v382[0] = v120;
        uint64_t v183 = sub_1000326B0();
        uint64_t v185 = v184;
        *(void *)(v182 + 56) = &type metadata for String;
        *(void *)(v182 + 64) = sub_1000101FC();
        *(void *)(v182 + 32) = v183;
        *(void *)(v182 + 40) = v185;
        sub_100032A70();
        sub_1000320A0();

        swift_bridgeObjectRelease();
        swift_getErrorValue();
        swift_getDynamicType();
        v382[0] = 0;
        v382[1] = 0xE000000000000000;
        sub_100032BB0(22);
        swift_bridgeObjectRelease();
        v382[0] = 0xD000000000000014;
        v382[1] = 0x80000001000371C0;
        v395._countAndFlagsBits = sub_100032E50();
        sub_1000328F0(v395);
        swift_bridgeObjectRelease();
        sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        swift_willThrow();
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v369);
        swift_release();
        swift_errorRelease();
        goto LABEL_34;
      }
      uint64_t v323 = 0;
      memcpy(v383, v382, sizeof(v383));
      LODWORD(v324) = LOBYTE(v383[9]);
      v317 = v383[26];
      v380 = v383[27];
      uint64_t v156 = v383[0];
      char v157 = v383[15];
      v305 = v383[14];
      v306 = v383[16];
      v158 = v383[17];
      char v159 = v383[23];
      v307 = v383[24];
      v308 = v383[22];
      uint64_t v160 = v383[25];
      v304 = v383[20];
      char v161 = v383[21];
      v315 = v383[12];
      int v314 = LOBYTE(v383[13]);
      uint64_t v162 = v383[42];
      sub_10000FAE8((uint64_t)&v383[3], (uint64_t)v384, &qword_100043178);
      v371 = v383[10];
      unint64_t v368 = (unint64_t)v383[11];
      v360 = (char *)sub_1000101BC();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_10001D634((uint64_t)v384);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v372 = (uint64_t)v162;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_10001D634((uint64_t)v384);
      unint64_t v363 = (unint64_t)v159;
      unint64_t v163 = (unint64_t)v161;
      int v164 = v158;
      swift_bridgeObjectRetain();
      v364 = v160;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(void *)&long long v367 = v157;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v361 = v156;
      swift_bridgeObjectRetain();
      sub_10001D634((uint64_t)v384);
      swift_bridgeObjectRetain();
      sub_10000EDD8((uint64_t)v371, v368);
      sub_1000137BC(v383);
      __int16 v165 = (void *)sub_100032B40();
      uint64_t v310 = sub_10000CE90(&qword_100043190);
      uint64_t v166 = swift_allocObject();
      long long v309 = xmmword_100037F60;
      *(_OWORD *)(v166 + 16) = xmmword_100037F60;
      sub_100032050();
      v167 = v107;
      uint64_t v168 = (uint64_t)v373;
      sub_100032780();
      v169 = *(void (**)(char *, uint64_t))(v374 + 8);
      v374 += 8;
      v321 = v169;
      v169(v167, v377);
      uint64_t v170 = sub_100031FA0();
      uint64_t v171 = *(void *)(v170 - 8);
      v172 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v171 + 56);
      uint64_t v311 = v171 + 56;
      v312 = v172;
      v172(v168, 0, 1, v170);
      uint64_t v313 = v170;
      uint64_t v173 = sub_1000326B0();
      uint64_t v175 = v174;
      sub_10000F0CC(v168, &qword_100043108);
      *(void *)(v166 + 56) = &type metadata for String;
      unint64_t v176 = sub_1000101FC();
      *(void *)(v166 + 64) = v176;
      *(void *)(v166 + 32) = v173;
      *(void *)(v166 + 40) = v175;
      sub_100032A70();
      sub_1000320A0();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v324)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10000EEA8((uint64_t)v371, v368);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        sub_10000F900(v383);
        v186 = v357;
        v187 = v320;
        sub_100032050();
        v188 = v358;
        uint64_t v189 = v323;
        sub_100032570();
        if (!v189)
        {
          (*(void (**)(char *, void, uint64_t))(v366 + 104))(v188, enum case for BasicTextMessage.MessageType.typingIndicator(_:), v365);
          sub_1000324A0();
          uint64_t v191 = v375;
          unint64_t v192 = v369;
          uint64_t v193 = v370;
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v193, v192);
          swift_release();
          sub_10000F900(v383);
          return (*(uint64_t (**)(char *, uint64_t))(v191 + 8))(v187, v379);
        }
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v369);
        swift_release();
        sub_10000F900(v383);
        swift_bridgeObjectRelease();
        v321(v186, v377);
        goto LABEL_29;
      }
      v358 = (char *)v176;
      v316 = v164;
      v322 = (char *)v163;
      v177 = v361;
      swift_bridgeObjectRelease();
      v178 = v383[18];
      LODWORD(v357) = LOBYTE(v383[19]);
      if (v380)
      {
        unint64_t v179 = v369;
        uint64_t v180 = (uint64_t)v359;
        if (v317 == (char *)0xD000000000000025 && v380 == (char *)0x80000001000373F0 || (sub_100032D70() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v177)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            unint64_t v222 = (unint64_t)v322;
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            sub_10001D660((uint64_t)v384);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10000EEA8((uint64_t)v371, v368);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10001D660((uint64_t)v384);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10001D660((uint64_t)v384);
            swift_bridgeObjectRelease();
            sub_10000F900(v383);
            os_log_type_t v223 = sub_100032A50();
            v224 = sub_100032B10();
            os_log_type_t v225 = v223;
            if (os_log_type_enabled(v224, v223))
            {
              unint64_t v226 = (unint64_t)v380;
              swift_bridgeObjectRetain();
              v227 = (uint8_t *)swift_slowAlloc();
              v382[0] = swift_slowAlloc();
              *(_DWORD *)v227 = 136446210;
              v228 = v320;
              v378 = (void (*)(uint64_t, uint64_t))(v227 + 4);
              swift_bridgeObjectRetain();
              uint64_t v381 = sub_10001D7B0((uint64_t)v317, v226, v382);
              sub_100032B80();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v224, v225, "Returning unsupported message type for %{public}s", v227, 0xCu);
              swift_arrayDestroy();
              unint64_t v222 = (unint64_t)v322;
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v229 = v370;
            }
            else
            {
              swift_bridgeObjectRelease();

              uint64_t v229 = v370;
              v228 = v320;
            }
            v275 = v346;
            sub_100032050();
            v276 = v347;
            v277 = (char *)v323;
            sub_100032540();
            v380 = v277;
            if (v277)
            {
              sub_10000EEA8(v318, v319);
              sub_10000EEBC(v229, v369);
              swift_release();
              sub_10000F900(v383);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v321(v275, v377);
              return (*(uint64_t (**)(char *, uint64_t))(v375 + 8))(v228, v379);
            }
            else
            {
              (*(void (**)(char *, void, uint64_t))(v366 + 104))(v276, enum case for BasicTextMessage.MessageType.unsupported(_:), v365);
              uint64_t v278 = v375;
              if (v222) {
                sub_10001EC38((uint64_t)v304, v222);
              }
              unint64_t v284 = v369;
              sub_1000324A0();
              sub_10000EEA8(v318, v319);
              sub_10000EEBC(v229, v284);
              swift_release();
              sub_10000F900(v383);
              return (*(uint64_t (**)(char *, uint64_t))(v278 + 8))(v228, v379);
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v179 = v369;
        uint64_t v180 = (uint64_t)v359;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000137BC(v383);
      uint64_t v190 = v323;
      BasicMessage.init(messageDictionary:)(v383, v180);
      if (v190)
      {
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v179);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_release();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10000EEA8((uint64_t)v371, v368);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        sub_10000F900(v383);
LABEL_33:
        sub_10000F900(v383);
        goto LABEL_34;
      }
      v194 = v351;
      sub_100019268(v351);
      int v195 = (*(uint64_t (**)(char *, uint64_t, int *))(v352 + 48))(v194, 1, v353);
      v324 = v178;
      if (v195 == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        sub_10000F0CC((uint64_t)v194, &qword_100043410);
LABEL_66:
        v249 = v371;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v250 = BYTE1(v383[9]);
        v251 = v320;
        if (BYTE1(v383[9]) == 2)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v250)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10001D660((uint64_t)v384);
            sub_10000F900(v383);
            v266 = (void *)sub_100032B40();
            uint64_t v267 = swift_allocObject();
            *(_OWORD *)(v267 + 16) = v309;
            v268 = (char *)v376;
            v187 = v251;
            sub_100032050();
            uint64_t v269 = (uint64_t)v373;
            sub_100032780();
            v321(v268, v377);
            v312(v269, 0, 1, v313);
            uint64_t v270 = sub_1000326B0();
            uint64_t v272 = v271;
            sub_10000F0CC(v269, &qword_100043108);
            v273 = v358;
            *(void *)(v267 + 56) = &type metadata for String;
            *(void *)(v267 + 64) = v273;
            *(void *)(v267 + 32) = v270;
            *(void *)(v267 + 40) = v272;
            sub_100032A70();
            sub_1000320A0();

            swift_bridgeObjectRelease();
            sub_100032050();
            sub_1000321F0();
            sub_1000321D0();
            unint64_t v274 = v368;
            if (v368 >> 60 != 15)
            {
              sub_10000CE90(&qword_100043438);
              uint64_t v279 = swift_allocObject();
              *(_OWORD *)(v279 + 16) = v309;
              *(void *)(v279 + 32) = v371;
              *(void *)(v279 + 40) = v274;
            }
            uint64_t v265 = v370;
            v280 = v340;
            sub_1000324C0();
            (*(void (**)(char *, void, uint64_t))(v366 + 104))(v280, enum case for BasicTextMessage.MessageType.audioMessage(_:), v365);
            uint64_t v264 = v375;
            if (v322) {
              sub_10001EC38((uint64_t)v304, (unint64_t)v322);
            }
            goto LABEL_76;
          }
        }
        sub_10000EEA8((uint64_t)v249, v368);
        sub_10001D660((uint64_t)v384);
        sub_10000FAE8((uint64_t)v384, (uint64_t)v391, &qword_100043178);
        if (v392)
        {
          sub_10000F900(v383);
          v187 = v251;
LABEL_72:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v253 = (unint64_t)v322;
LABEL_73:
          v254 = v373;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v255 = (void *)sub_100032B40();
          uint64_t v256 = swift_allocObject();
          *(_OWORD *)(v256 + 16) = v309;
          v257 = (char *)v376;
          sub_100032050();
          sub_100032780();
          v321(v257, v377);
          v312((uint64_t)v254, 0, 1, v313);
          uint64_t v258 = sub_1000326B0();
          uint64_t v259 = (uint64_t)v254;
          uint64_t v261 = v260;
          sub_10000F0CC(v259, &qword_100043108);
          v262 = v358;
          *(void *)(v256 + 56) = &type metadata for String;
          *(void *)(v256 + 64) = v262;
          *(void *)(v256 + 32) = v258;
          *(void *)(v256 + 40) = v261;
          sub_100032A70();
          sub_1000320A0();

          swift_bridgeObjectRelease();
          sub_100032050();
          v263 = v349;
          (*(void (**)(char *, char *, uint64_t))(v356 + 16))(v349, v359, v355);
          (*(void (**)(char *, void, uint64_t))(v366 + 104))(v263, enum case for BasicTextMessage.MessageType.textMessage(_:), v365);
          if (v253) {
            sub_10001EC38((uint64_t)v304, v253);
          }
          uint64_t v264 = v375;
          uint64_t v265 = v370;
LABEL_76:
          sub_1000324A0();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v265, v369);
          swift_release();
          (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
          sub_10000F900(v383);
          return (*(uint64_t (**)(char *, uint64_t))(v264 + 8))(v187, v379);
        }
        sub_10000FAE8((uint64_t)&v383[5], (uint64_t)v385, &qword_100043178);
        sub_10000FAE8((uint64_t)v385, (uint64_t)v389, &qword_100043178);
        uint64_t v252 = v390;
        sub_10000F900(v383);
        v187 = v251;
        if (v252) {
          goto LABEL_72;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10000FAE8((uint64_t)&v383[7], (uint64_t)v386, &qword_100043178);
        sub_10000FAE8((uint64_t)v386, (uint64_t)v387, &qword_100043178);
        if (v388)
        {
          unint64_t v253 = (unint64_t)v322;
          goto LABEL_73;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v285 = (void *)sub_100032B20();
        uint64_t v286 = swift_allocObject();
        v380 = 0;
        v287 = (void *)v286;
        *(_OWORD *)(v286 + 16) = v309;
        v288 = (char *)v376;
        sub_100032050();
        uint64_t v289 = (uint64_t)v373;
        sub_100032780();
        v290 = v321;
        v321(v288, v377);
        v312(v289, 0, 1, v313);
        uint64_t v291 = sub_1000326B0();
        uint64_t v293 = v292;
        sub_10000F0CC(v289, &qword_100043108);
        v294 = v358;
        v287[7] = &type metadata for String;
        v287[8] = v294;
        v287[4] = v291;
        v287[5] = v293;
        sub_100032A70();
        sub_1000320A0();

        swift_bridgeObjectRelease();
        v295 = v329;
        sub_100032050();
        v296 = v330;
        v297 = v380;
        sub_100032570();
        if (!v297)
        {
          (*(void (**)(char *, void, uint64_t))(v366 + 104))(v296, enum case for BasicTextMessage.MessageType.typingIndicator(_:), v365);
          if (v322) {
            sub_10001EC38((uint64_t)v304, (unint64_t)v322);
          }
LABEL_111:
          sub_1000324A0();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
          goto LABEL_33;
        }
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v369);
        swift_release();
        sub_10000F900(v383);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v290(v295, v377);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
LABEL_29:
        uint64_t v115 = *(uint64_t (**)(char *, uint64_t))(v375 + 8);
        uint64_t v116 = v187;
        return v115(v116, v379);
      }
      uint64_t v196 = v354;
      sub_10001D68C((uint64_t)v194, v354);
      if (!v361)
      {
        sub_10001D6F0(v196);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        goto LABEL_66;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      sub_10001D660((uint64_t)v384);
      uint64_t v197 = v354;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10000EEA8((uint64_t)v371, v368);
      v199 = v343;
      uint64_t v198 = v344;
      v200 = (char *)(v344 + 16);
      uint64_t v201 = v197;
      uint64_t v202 = v197;
      v203 = *(void (**)(char *, uint64_t, uint64_t))(v344 + 16);
      uint64_t v204 = v348;
      v203(v343, v202, v348);
      int v205 = (*(uint64_t (**)(char *, uint64_t))(v198 + 88))(v199, v204);
      uint64_t v206 = (uint64_t)v342;
      v380 = 0;
      if (v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackHeart(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackThumbsUp(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackThumbsDown(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackHa(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackExclamation(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackQuestionMark(_:))
      {
        goto LABEL_61;
      }
      if (v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackEmoji(_:))
      {
LABEL_54:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        v207 = (void *)sub_100032B20();
        uint64_t v208 = swift_allocObject();
        *(_OWORD *)(v208 + 16) = v309;
        v209 = (char *)v376;
        sub_100032050();
        uint64_t v210 = (uint64_t)v373;
        sub_100032780();
        v321(v209, v377);
        v312(v210, 0, 1, v313);
        uint64_t v211 = sub_1000326B0();
        uint64_t v213 = v212;
        sub_10000F0CC(v210, &qword_100043108);
        v214 = v358;
        *(void *)(v208 + 56) = &type metadata for String;
        *(void *)(v208 + 64) = v214;
        *(void *)(v208 + 32) = v211;
        *(void *)(v208 + 40) = v213;
        sub_100032A70();
        sub_1000320A0();

        swift_bridgeObjectRelease();
        sub_10000FAE8((uint64_t)v384, (uint64_t)v393, &qword_100043178);
        if (!v393[1])
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10000F900(v383);
          uint64_t v221 = v375;
          uint64_t v216 = v370;
          v217 = v359;
          goto LABEL_100;
        }
        v215 = (void *)(v354 + v353[8]);
        uint64_t v216 = v370;
        v217 = v359;
        if (!v215[1])
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10000F900(v383);
          sub_10001D660((uint64_t)v384);
          uint64_t v221 = v375;
          goto LABEL_100;
        }
        v373 = (char *)v393[0];
        *(void *)&long long v376 = *v215;
        swift_bridgeObjectRetain();
        sub_100032260();
        uint64_t v218 = (uint64_t)v333;
        sub_1000324D0();
        uint64_t v220 = v334;
        uint64_t v219 = v335;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v334 + 48))(v218, 1, v335) == 1)
        {
          swift_bridgeObjectRelease();
          sub_10001D660((uint64_t)v384);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10000F900(v383);
          sub_10000F0CC(v218, &qword_100043400);
          uint64_t v221 = v375;
          v217 = v359;
LABEL_100:
          sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
          swift_allocError();
          sub_1000327B0();
          swift_willThrow();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v216, v369);
          swift_release();
          sub_10000F900(v383);
          sub_10001D6F0(v354);
          (*(void (**)(char *, uint64_t))(v356 + 8))(v217, v355);
          return (*(uint64_t (**)(char *, uint64_t))(v221 + 8))(v320, v379);
        }
        v298 = v332;
        (*(void (**)(char *, uint64_t, uint64_t))(v220 + 32))(v332, v218, v219);
        sub_100032050();
        (*(void (**)(char *, char *, uint64_t))(v220 + 16))(v327, v298, v219);
        uint64_t v299 = v353[6];
        v371 = *(char **)(v354 + v353[5]);
        v378 = *(void (**)(uint64_t, uint64_t))(v354 + v299);
        unint64_t v368 = *(void *)(v354 + v353[7] + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_10000FF78(v326);
        sub_10000F900(v383);
        v300 = v328;
        v301 = v380;
        sub_1000324F0();
        if (v301)
        {
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          sub_10000F900(v383);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v321(v331, v377);
        }
        else
        {
          (*(void (**)(char *, void, uint64_t))(v366 + 104))(v300, enum case for BasicTextMessage.MessageType.emojiTapback(_:), v365);
          if (v322) {
            sub_10001EC38((uint64_t)v304, (unint64_t)v322);
          }
          sub_1000324A0();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          sub_10000F900(v383);
        }
        (*(void (**)(char *, uint64_t))(v334 + 8))(v332, v335);
LABEL_64:
        sub_10001D6F0(v354);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
        goto LABEL_34;
      }
      if (v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedHeart(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedThumbsUp(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedThumbsDown(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedHa(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedExclamation(_:)
        || v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedQuestionMark(_:))
      {
LABEL_61:
        unint64_t v368 = (unint64_t)v203;
        v371 = v200;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        v230 = (void *)sub_100032B20();
        uint64_t v231 = swift_allocObject();
        *(_OWORD *)(v231 + 16) = xmmword_100038720;
        sub_10001D74C(v201, v206);
        uint64_t v232 = v206;
        uint64_t v233 = v206;
        v234 = v353;
        (*(void (**)(uint64_t, void, uint64_t, int *))(v352 + 56))(v232, 0, 1, v353);
        uint64_t v235 = sub_1000326B0();
        uint64_t v237 = v236;
        sub_10000F0CC(v233, &qword_100043410);
        v238 = v358;
        *(void *)(v231 + 56) = &type metadata for String;
        *(void *)(v231 + 64) = v238;
        *(void *)(v231 + 32) = v235;
        *(void *)(v231 + 40) = v237;
        v239 = (char *)v376;
        v240 = v320;
        sub_100032050();
        uint64_t v241 = (uint64_t)v373;
        sub_100032780();
        v321(v239, v377);
        v312(v241, 0, 1, v313);
        uint64_t v242 = sub_1000326B0();
        uint64_t v244 = v243;
        sub_10000F0CC(v241, &qword_100043108);
        *(void *)(v231 + 96) = &type metadata for String;
        *(void *)(v231 + 104) = v238;
        *(void *)(v231 + 72) = v242;
        *(void *)(v231 + 80) = v244;
        sub_100032A70();
        sub_1000320A0();

        swift_bridgeObjectRelease();
        sub_10000FAE8((uint64_t)v384, (uint64_t)v394, &qword_100043178);
        if (!v394[1])
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10000F900(v383);
          sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
          swift_allocError();
          sub_1000327B0();
          swift_willThrow();
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          sub_10000F900(v383);
          sub_10001D6F0(v354);
          (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
          uint64_t v115 = *(uint64_t (**)(char *, uint64_t))(v375 + 8);
          uint64_t v116 = v240;
          return v115(v116, v379);
        }
        v378 = (void (*)(uint64_t, uint64_t))v394[0];
        sub_100032050();
        uint64_t v245 = v354;
        ((void (*)(char *, uint64_t, uint64_t))v368)(v336, v354, v348);
        uint64_t v246 = v234[6];
        v373 = *(char **)(v245 + v234[5]);
        *(void *)&long long v376 = *(void *)(v245 + v246);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_10000FF78(v337);
        sub_10000F900(v383);
        v247 = v338;
        v248 = v380;
        sub_100032280();
        if (v248)
        {
          sub_10000EEA8(v318, v319);
          sub_10000EEBC(v370, v369);
          swift_release();
          sub_10000F900(v383);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v321(v341, v377);
          goto LABEL_64;
        }
        (*(void (**)(char *, void, uint64_t))(v366 + 104))(v247, enum case for BasicTextMessage.MessageType.tapback(_:), v365);
        uint64_t v281 = v375;
        unint64_t v282 = v369;
        unint64_t v283 = v319;
        if (v322) {
          sub_10001EC38((uint64_t)v304, (unint64_t)v322);
        }
        v302 = v320;
        sub_1000324A0();
        sub_10000EEA8(v318, v283);
        sub_10000EEBC(v370, v282);
        swift_release();
        sub_10000F900(v383);
        sub_10001D6F0(v354);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
        return (*(uint64_t (**)(char *, uint64_t))(v281 + 8))(v302, v379);
      }
      else
      {
        if (v205 == enum case for BasicTapBack.AssociatedMessageType.tapbackDeselectedEmoji(_:)) {
          goto LABEL_54;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10001D660((uint64_t)v384);
        sub_10000F900(v383);
        sub_10001D598((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        swift_willThrow();
        sub_10000EEA8(v318, v319);
        sub_10000EEBC(v370, v369);
        swift_release();
        sub_10000F900(v383);
        sub_10001D6F0(v201);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v359, v355);
        (*(void (**)(char *, uint64_t))(v375 + 8))(v320, v379);
        return (*(uint64_t (**)(char *, uint64_t))(v344 + 8))(v343, v348);
      }
  }
}

uint64_t sub_10001D4E0@<X0>(void (*a1)(uint64_t, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000195EC(a1, a2, a3);
}

uint64_t _s17AssociatedMessageVMa()
{
  uint64_t result = qword_1000434C0;
  if (!qword_1000434C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10001D544()
{
  unint64_t result = qword_100043428;
  if (!qword_100043428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043428);
  }
  return result;
}

uint64_t sub_10001D598(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001D5E0()
{
  unint64_t result = qword_100043430;
  if (!qword_100043430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100043430);
  }
  return result;
}

uint64_t sub_10001D634(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D660(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D68C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s17AssociatedMessageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D6F0(uint64_t a1)
{
  uint64_t v2 = _s17AssociatedMessageVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001D74C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s17AssociatedMessageVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D7B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001D884(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001DE84((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001DE84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000136B4((uint64_t)v12);
  return v7;
}

uint64_t sub_10001D884(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100032B90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001DA40(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100032BF0();
  if (!v8)
  {
    sub_100032C00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100032C50();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001DA40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001DAD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001DD34(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001DD34(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001DAD8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10001DC50(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100032BC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100032C00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100032900();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100032C50();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100032C00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001DC50(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000CE90(&qword_100043440);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001DCB8(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100032950();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_100032920();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10001DD34(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CE90(&qword_100043440);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100032C50();
  __break(1u);
  return result;
}

uint64_t sub_10001DE84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for BasicTextMessageUnpacker.EncryptedMessageMissingData()
{
  return &type metadata for BasicTextMessageUnpacker.EncryptedMessageMissingData;
}

uint64_t *sub_10001DEF0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100032270();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    size_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    unint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[8];
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001E004(uint64_t a1)
{
  uint64_t v2 = sub_100032270();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E09C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  unint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001E160(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001E270(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_10001E308(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100032270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001E3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E3E8);
}

uint64_t sub_10001E3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100032270();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10001E4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001E4C0);
}

uint64_t sub_10001E4C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100032270();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10001E580()
{
  uint64_t result = sub_100032270();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeliveryReceiptUnpacker()
{
  return &type metadata for DeliveryReceiptUnpacker;
}

unint64_t sub_10001E63C(uint64_t a1)
{
  unint64_t result = sub_10000CED4();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10001E664()
{
  return sub_10001E8DC(&qword_100043508, (void (*)(uint64_t))&type metadata accessor for DeliveryReceipt);
}

uint64_t sub_10001E6AC(uint64_t a1, uint64_t a2)
{
  return sub_10001E6D8(a1, a2, (void (*)(char *))&ReadReceipt.init(with:));
}

uint64_t sub_10001E6D8(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v13 = a3;
  uint64_t v4 = sub_100032790();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032070();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031F00();
  swift_allocObject();
  sub_100031EF0();
  sub_10001E8DC(&qword_100043420, (void (*)(uint64_t))&type metadata accessor for TopLevelDictionary);
  sub_100031EE0();
  uint64_t result = swift_release();
  if (!v3)
  {
    sub_100032050();
    v13(v6);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return result;
}

uint64_t sub_10001E8B0(uint64_t a1, uint64_t a2)
{
  return sub_10001E6D8(a1, a2, (void (*)(char *))&DeliveryReceipt.init(with:));
}

uint64_t sub_10001E8DC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _AttributedString.init(fromNSAttributedString:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100032530();
  uint64_t v20 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v7 = [a1 string];
  if (!v7)
  {
    sub_100032870();
    NSString v7 = sub_100032840();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = sub_100032870();
  uint64_t v10 = v9;
  uint64_t v24 = &_swiftEmptyArrayStorage;
  uint64_t v23 = 0;
  uint64_t result = (uint64_t)[v7 length];
  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v12 = result;
  uint64_t v18 = v4;
  uint64_t v19 = a2;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v8;
  v13[3] = v10;
  v13[4] = &v23;
  v13[5] = &v24;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_100022C7C;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_100022C98;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100021254;
  aBlock[3] = &unk_10003E530;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v23)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = v21;
    sub_100032520();

    if (!v16) {
      (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v19, v6, v18);
    }
    goto LABEL_10;
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v23)
  {
    swift_errorRetain();
    swift_willThrow();

LABEL_10:
    swift_errorRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_10001EC38(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t v8 = sub_100022CD8(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_100022DD0);
    char v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      NSString v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      NSString v7 = (unsigned __int8 *)sub_100032BF0();
    }
    unint64_t v8 = (unint64_t)sub_100022DD0(v7, v5, 10);
    char v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4) {
      goto LABEL_52;
    }
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (BYTE1(a1) - 48);
    uint64_t v15 = v4 - 2;
    if (v15)
    {
      uint64_t v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        unsigned int v17 = *v16 - 48;
        if (v17 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v17);
        unint64_t v8 = 10 * v8 + v17;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_39;
        }
      }
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (a1 - 48);
    uint64_t v18 = v4 - 1;
    if (v18)
    {
      uint64_t v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        unsigned int v21 = *v20 - 48;
        if (v21 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v21);
        unint64_t v8 = 10 * v8 + v21;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v20;
        if (!--v18) {
          goto LABEL_39;
        }
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      unint64_t v2 = 0;
      unint64_t v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        uint64_t v11 = v4 - 2;
        if (v11)
        {
          uint64_t v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            unsigned int v13 = *v12 - 48;
            if (v13 > 9) {
              goto LABEL_36;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_36;
            }
            BOOL v14 = 10 * v8 >= v13;
            unint64_t v8 = 10 * v8 - v13;
            if (!v14) {
              goto LABEL_36;
            }
            char v10 = 0;
            ++v12;
            if (!--v11) {
              goto LABEL_39;
            }
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    unint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  char v10 = 1;
  unint64_t v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if (v10) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t sub_10001EEAC(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_100032BF0();
      }
      uint64_t v7 = (uint64_t)sub_10002304C(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = sub_100022CD8(result, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_10002304C);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_10001F110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char **a8)
{
  uint64_t v109 = a7;
  uint64_t v111 = a6;
  uint64_t v108 = a4;
  uint64_t v12 = sub_10000CE90(&qword_100043538);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100031F40();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v91 - v20;
  uint64_t v22 = sub_10000CE90(&qword_100043540);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100031ED0();
  if (result != a2)
  {
    uint64_t v114 = a2 + a3;
    if (!__OFADD__(a2, a3))
    {
      uint64_t v97 = v21;
      uint64_t v98 = v19;
      uint64_t v103 = v15;
      id v102 = v14;
      uint64_t v113 = a2;
      uint64_t v26 = *(void *)(a1 + 64);
      uint64_t v106 = a1 + 64;
      uint64_t v27 = 1 << *(unsigned char *)(a1 + 32);
      uint64_t v28 = -1;
      if (v27 < 64) {
        uint64_t v28 = ~(-1 << v27);
      }
      unint64_t v29 = v28 & v26;
      uint64_t v116 = (uint64_t)&v124 + 8;
      uint64_t v118 = &v128;
      uint64_t v117 = MBDIMFileTransferAttributeName;
      uint64_t v107 = MBDIMBaseWritingDirectionAttributeName;
      uint64_t v105 = MBDIMMessagePartAttributeName;
      uint64_t v104 = MBDIMLinkAttributeName;
      uint64_t v101 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
      unint64_t v100 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
      uint64_t v99 = MBDIMLinkIsRichLinkAttributeName;
      uint64_t v96 = (void (**)(char *, uint64_t, uint64_t))(v16 + 32);
      uint64_t v95 = (void (**)(char *, char *, uint64_t))(v16 + 16);
      uint64_t v94 = (void (**)(char *, uint64_t))(v16 + 8);
      int64_t v112 = (unint64_t)(v27 + 63) >> 6;
      int64_t v92 = v112 - 1;
      uint64_t result = swift_bridgeObjectRetain();
      int64_t v30 = 0;
      uint64_t v115 = (char *)&type metadata for Any + 8;
      long long v93 = xmmword_1000388F0;
      uint64_t v110 = v24;
      while (!v29)
      {
        int64_t v36 = v30 + 1;
        if (__OFADD__(v30, 1))
        {
          __break(1u);
          goto LABEL_83;
        }
        if (v36 < v112)
        {
          unint64_t v37 = *(void *)(v106 + 8 * v36);
          if (v37) {
            goto LABEL_14;
          }
          v30 += 2;
          if (v36 + 1 >= v112)
          {
            int64_t v30 = v36;
          }
          else
          {
            unint64_t v37 = *(void *)(v106 + 8 * v30);
            if (v37)
            {
              ++v36;
              goto LABEL_14;
            }
            if (v36 + 2 < v112)
            {
              unint64_t v37 = *(void *)(v106 + 8 * (v36 + 2));
              if (v37)
              {
                v36 += 2;
                goto LABEL_14;
              }
              int64_t v81 = v36 + 3;
              if (v36 + 3 < v112)
              {
                unint64_t v37 = *(void *)(v106 + 8 * v81);
                if (!v37)
                {
                  while (1)
                  {
                    int64_t v36 = v81 + 1;
                    if (__OFADD__(v81, 1)) {
                      goto LABEL_84;
                    }
                    if (v36 >= v112)
                    {
                      int64_t v30 = v92;
                      goto LABEL_19;
                    }
                    unint64_t v37 = *(void *)(v106 + 8 * v36);
                    ++v81;
                    if (v37) {
                      goto LABEL_14;
                    }
                  }
                }
                v36 += 3;
LABEL_14:
                unint64_t v29 = (v37 - 1) & v37;
                unint64_t v32 = __clz(__rbit64(v37)) + (v36 << 6);
                int64_t v30 = v36;
LABEL_10:
                uint64_t v33 = *(void *)(a1 + 56);
                *(void *)&long long v124 = *(void *)(*(void *)(a1 + 48) + 8 * v32);
                uint64_t v34 = (void *)v124;
                sub_10001DE84(v33 + 32 * v32, v116);
                id v35 = v34;
                goto LABEL_20;
              }
              int64_t v30 = v36 + 2;
            }
          }
        }
LABEL_19:
        unint64_t v29 = 0;
        uint64_t v126 = 0;
        long long v124 = 0u;
        long long v125 = 0u;
LABEL_20:
        sub_10000FAE8((uint64_t)&v124, (uint64_t)&v127, &qword_100043548);
        uint64_t v38 = v127;
        if (!v127) {
          return swift_release();
        }
        sub_100023A54(v118, &v123);
        uint64_t v126 = 0;
        long long v124 = 0u;
        long long v125 = 0u;
        uint64_t v39 = sub_100032870();
        uint64_t v41 = v40;
        if (v39 == sub_100032870() && v41 == v42)
        {
          swift_bridgeObjectRelease_n();
LABEL_25:
          sub_10001DE84((uint64_t)&v123, (uint64_t)&v120);
          sub_10000CE90(&qword_100043530);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_40;
          }
          uint64_t v44 = (uint64_t)v119;
          swift_bridgeObjectRetain();
          uint64_t v45 = (uint64_t)v110;
          FileTransferAttribute.init(fileTransferDict:string:range:)(v44, v113, v114, (uint64_t)v110);
          uint64_t v50 = sub_100032600();
          uint64_t v51 = *(void *)(v50 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48))(v45, 1, v50) == 1)
          {
            sub_10000F0CC((uint64_t)&v124, &qword_100043550);
            sub_10000F0CC(v45, &qword_100043540);
            long long v120 = 0u;
            long long v121 = 0u;
            uint64_t v122 = 0;
          }
          else
          {
            *((void *)&v121 + 1) = v50;
            uint64_t v122 = sub_100023B70(&qword_100043578, (void (*)(uint64_t))&type metadata accessor for FileTransferAttribute);
            uint64_t v54 = sub_100023AB8((uint64_t *)&v120);
            (*(void (**)(uint64_t *, uint64_t, uint64_t))(v51 + 32))(v54, v45, v50);
            sub_10000F0CC((uint64_t)&v124, &qword_100043550);
          }
          goto LABEL_39;
        }
        char v43 = sub_100032D70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v43) {
          goto LABEL_25;
        }
        uint64_t v46 = sub_100032870();
        uint64_t v48 = v47;
        if (v46 == sub_100032870() && v48 == v49)
        {
          swift_bridgeObjectRelease_n();
LABEL_33:
          sub_10001DE84((uint64_t)&v123, (uint64_t)&v120);
          sub_100023A7C(0, (unint64_t *)&qword_1000431C8);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_40;
          }
          id v53 = v119;
          sub_100032A10();
          *((void *)&v121 + 1) = sub_1000326A0();
          uint64_t v122 = sub_100023B70(&qword_100043570, (void (*)(uint64_t))&type metadata accessor for BaseWritingDirectionAttribute);
          sub_100023AB8((uint64_t *)&v120);
          sub_100032690();
          sub_10000F0CC((uint64_t)&v124, &qword_100043550);

LABEL_39:
          sub_10000FAE8((uint64_t)&v120, (uint64_t)&v124, &qword_100043550);
          goto LABEL_40;
        }
        char v52 = sub_100032D70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v52) {
          goto LABEL_33;
        }
        uint64_t v55 = sub_100032870();
        uint64_t v57 = v56;
        if (v55 == sub_100032870() && v57 == v58)
        {
          swift_bridgeObjectRelease_n();
LABEL_48:
          sub_10001DE84((uint64_t)&v123, (uint64_t)&v120);
          sub_100023A7C(0, (unint64_t *)&qword_1000431C8);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_40;
          }
          id v64 = v119;
          sub_100032B70();
          *((void *)&v121 + 1) = sub_100032590();
          uint64_t v122 = sub_100023B70(&qword_100043568, (void (*)(uint64_t))&type metadata accessor for MessagePartAttribute);
          sub_100023AB8((uint64_t *)&v120);
          sub_100032580();
LABEL_50:

LABEL_51:
          sub_10000F0CC((uint64_t)&v124, &qword_100043550);
          sub_100023A64(&v120, (uint64_t)&v124);
          goto LABEL_40;
        }
        char v63 = sub_100032D70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v63) {
          goto LABEL_48;
        }
        uint64_t v65 = sub_100032870();
        uint64_t v67 = v66;
        if (v65 == sub_100032870() && v67 == v68)
        {
          swift_bridgeObjectRelease_n();
LABEL_59:
          sub_10001DE84((uint64_t)&v123, (uint64_t)&v120);
          uint64_t v70 = (uint64_t)v102;
          uint64_t v71 = v103;
          int v72 = swift_dynamicCast();
          uint64_t v73 = *v101;
          if (v72)
          {
            v73(v70, 0, 1, v71);
            if ((*v100)(v70, 1, v71) != 1)
            {
              uint64_t v74 = v97;
              uint64_t v75 = v70;
              uint64_t v76 = v103;
              (*v96)(v97, v75, v103);
              (*v95)(v98, v74, v76);
              *((void *)&v121 + 1) = sub_100032420();
              uint64_t v122 = sub_100023B70(&qword_100043560, (void (*)(uint64_t))&type metadata accessor for LinkAttribute);
              sub_100023AB8((uint64_t *)&v120);
              sub_100032410();
              (*v94)(v74, v76);
              goto LABEL_51;
            }
          }
          else
          {
            v73(v70, 1, 1, v71);
          }
          sub_10000F0CC(v70, &qword_100043538);
          goto LABEL_40;
        }
        char v69 = sub_100032D70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v69) {
          goto LABEL_59;
        }
        uint64_t v77 = sub_100032870();
        uint64_t v79 = v78;
        if (v77 == sub_100032870() && v79 == v80)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v82 = sub_100032D70();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v82 & 1) == 0)
          {
            sub_100023A7C(0, (unint64_t *)&qword_100043188);
            uint64_t v91 = sub_100032B20();
            sub_10000CE90(&qword_100043190);
            uint64_t v83 = swift_allocObject();
            *(_OWORD *)(v83 + 16) = v93;
            uint64_t v84 = sub_100032870();
            uint64_t v86 = v85;
            *(void *)(v83 + 56) = &type metadata for String;
            unint64_t v87 = sub_1000101FC();
            *(void *)(v83 + 32) = v84;
            *(void *)(v83 + 40) = v86;
            *(void *)(v83 + 96) = &type metadata for Int;
            uint64_t v88 = v113;
            *(void *)(v83 + 64) = v87;
            *(void *)(v83 + 72) = v88;
            *(void *)(v83 + 136) = &type metadata for Int;
            *(void *)(v83 + 144) = &protocol witness table for Int;
            uint64_t v89 = v114;
            *(void *)(v83 + 104) = &protocol witness table for Int;
            *(void *)(v83 + 112) = v89;
            sub_100032A70();
            uint64_t v90 = (void *)v91;
            sub_1000320A0();

            swift_bridgeObjectRelease();
            goto LABEL_40;
          }
        }
        sub_10001DE84((uint64_t)&v123, (uint64_t)&v120);
        sub_100023A7C(0, (unint64_t *)&qword_1000431C8);
        if (swift_dynamicCast())
        {
          id v64 = v119;
          [v119 BOOLValue];
          *((void *)&v121 + 1) = sub_1000320D0();
          uint64_t v122 = sub_100023B70(&qword_100043558, (void (*)(uint64_t))&type metadata accessor for LinkIsRichLinkAttribute);
          sub_100023AB8((uint64_t *)&v120);
          sub_1000320C0();
          goto LABEL_50;
        }
LABEL_40:
        sub_10000F068((uint64_t)&v124, (uint64_t)&v120, &qword_100043550);
        if (*((void *)&v121 + 1))
        {
          sub_10000F0CC((uint64_t)&v120, &qword_100043550);
          uint64_t result = sub_10000F068((uint64_t)&v124, (uint64_t)&v120, &qword_100043550);
          if (!*((void *)&v121 + 1)) {
            goto LABEL_85;
          }
          uint64_t v59 = *a8;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *a8 = v59;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v59 = sub_100030458(0, *((void *)v59 + 2) + 1, 1, v59);
            *a8 = v59;
          }
          unint64_t v62 = *((void *)v59 + 2);
          unint64_t v61 = *((void *)v59 + 3);
          if (v62 >= v61 >> 1)
          {
            uint64_t v59 = sub_100030458((char *)(v61 > 1), v62 + 1, 1, v59);
            *a8 = v59;
          }
          *((void *)v59 + 2) = v62 + 1;
          sub_100023A64(&v120, (uint64_t)&v59[40 * v62 + 32]);
        }
        else
        {

          sub_10000F0CC((uint64_t)&v120, &qword_100043550);
        }
        sub_10000F0CC((uint64_t)&v124, &qword_100043550);
        uint64_t result = sub_1000136B4((uint64_t)&v123);
      }
      unint64_t v31 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      unint64_t v32 = v31 | (v30 << 6);
      goto LABEL_10;
    }
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
  }
  return result;
}

uint64_t FileTransferAttribute.init(fileTransferDict:string:range:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v107 = a2;
  uint64_t v108 = a3;
  uint64_t v118 = a4;
  uint64_t v117 = sub_100032600();
  uint64_t v5 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  uint64_t v109 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000CE90(&qword_100043510);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v106 = (uint64_t)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v110 = (char *)&v95 - v11;
  __chkstk_darwin(v10);
  uint64_t v111 = (uint64_t)&v95 - v12;
  uint64_t v13 = sub_100032620();
  uint64_t v112 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v14 = sub_10000CE90(&qword_100043518);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100032670();
  uint64_t v116 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000325C0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v113 = v20;
  uint64_t v114 = v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v105 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v115 = (char *)&v95 - v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_100032870();
  if (!*(void *)(a1 + 16) || (unint64_t v27 = sub_1000237B4(v25, v26), (v28 & 1) == 0))
  {
    long long v121 = 0u;
    long long v122 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_10001DE84(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v121);
  swift_bridgeObjectRelease();
  if (!*((void *)&v122 + 1))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
LABEL_11:
    sub_100032A60();
    sub_100023A7C(0, (unint64_t *)&qword_100043188);
    int64_t v36 = (void *)sub_100032B20();
    sub_1000320B0();

    uint64_t v37 = 1;
    uint64_t v39 = v117;
    uint64_t v38 = v118;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v38, v37, 1, v39);
  }
  sub_10000CE90(&qword_100043528);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(void *)(v119 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    return swift_willThrow();
  }
  uint64_t v104 = v119;
  uint64_t v29 = *(void *)(v119 + 32);
  uint64_t v30 = sub_100032870();
  uint64_t v32 = v31;
  if (*(void *)(v29 + 16))
  {
    uint64_t v33 = v30;
    swift_bridgeObjectRetain();
    unint64_t v34 = sub_1000237B4(v33, v32);
    if (v35)
    {
      sub_10001DE84(*(void *)(v29 + 56) + 32 * v34, (uint64_t)&v121);
    }
    else
    {
      long long v121 = 0u;
      long long v122 = 0u;
    }
  }
  else
  {
    long long v121 = 0u;
    long long v122 = 0u;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v122 + 1))
  {
    int v41 = swift_dynamicCast();
    uint64_t v42 = v119;
    if (!v41) {
      uint64_t v42 = 0;
    }
    uint64_t v99 = v42;
    if (v41) {
      unint64_t v43 = v120;
    }
    else {
      unint64_t v43 = 0;
    }
    unint64_t v102 = v43;
  }
  else
  {
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
    uint64_t v99 = 0;
    unint64_t v102 = 0;
  }
  uint64_t v44 = sub_100032870();
  if (*(void *)(v29 + 16) && (unint64_t v46 = sub_1000237B4(v44, v45), (v47 & 1) != 0))
  {
    sub_10001DE84(*(void *)(v29 + 56) + 32 * v46, (uint64_t)&v121);
  }
  else
  {
    long long v121 = 0u;
    long long v122 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v122 + 1))
  {
    int v48 = swift_dynamicCast();
    uint64_t v49 = v119;
    if (!v48) {
      uint64_t v49 = 0;
    }
    uint64_t v97 = v49;
    if (v48) {
      unint64_t v50 = v120;
    }
    else {
      unint64_t v50 = 0;
    }
    unint64_t v101 = v50;
  }
  else
  {
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
    uint64_t v97 = 0;
    unint64_t v101 = 0;
  }
  uint64_t v51 = sub_100032870();
  if (*(void *)(v29 + 16) && (unint64_t v53 = sub_1000237B4(v51, v52), (v54 & 1) != 0))
  {
    sub_10001DE84(*(void *)(v29 + 56) + 32 * v53, (uint64_t)&v121);
  }
  else
  {
    long long v121 = 0u;
    long long v122 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v122 + 1))
  {
    int v55 = swift_dynamicCast();
    uint64_t v56 = v119;
    if (!v55) {
      uint64_t v56 = 0;
    }
    uint64_t v96 = v56;
    if (v55) {
      unint64_t v57 = v120;
    }
    else {
      unint64_t v57 = 0;
    }
    unint64_t v100 = v57;
  }
  else
  {
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
    uint64_t v96 = 0;
    unint64_t v100 = 0;
  }
  uint64_t v58 = sub_100032870();
  if (*(void *)(v29 + 16) && (unint64_t v60 = sub_1000237B4(v58, v59), (v61 & 1) != 0))
  {
    sub_10001DE84(*(void *)(v29 + 56) + 32 * v60, (uint64_t)&v121);
  }
  else
  {
    long long v121 = 0u;
    long long v122 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v122 + 1))
  {
    int v62 = swift_dynamicCast();
    uint64_t v63 = v119;
    if (!v62) {
      uint64_t v63 = 0;
    }
    uint64_t v98 = v63;
    if (v62) {
      unint64_t v64 = v120;
    }
    else {
      unint64_t v64 = 0;
    }
    unint64_t v103 = v64;
  }
  else
  {
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
    uint64_t v98 = 0;
    unint64_t v103 = 0;
  }
  uint64_t v65 = v123;
  AudioMessageAttachmentInfo.init(audioMessageDict:)(v29, (uint64_t)v16);
  if (v65)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v66 = v116;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v116 + 48))(v16, 1, v17) == 1)
  {
    sub_10000F0CC((uint64_t)v16, &qword_100043518);
    sub_1000215A4(v104);
    swift_bridgeObjectRelease();
    sub_100032610();
    unint64_t v67 = v103;
    uint64_t v123 = 0;
    uint64_t v79 = v115;
    (*(void (**)(void))(v112 + 32))();
    uint64_t v81 = v113;
    uint64_t v80 = v114;
    (*(void (**)(char *, void, uint64_t))(v114 + 104))(v79, enum case for FileTransferAttribute.AttachmentSubtype.unspecified(_:), v113);
  }
  else
  {
    uint64_t v123 = 0;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v19, v16, v17);
    uint64_t v79 = v115;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v115, v19, v17);
    uint64_t v81 = v113;
    uint64_t v80 = v114;
    (*(void (**)(char *, void, uint64_t))(v114 + 104))(v79, enum case for FileTransferAttribute.AttachmentSubtype.audioMessage(_:), v113);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v19, v17);
    unint64_t v67 = v103;
  }
  uint64_t v68 = sub_100032870();
  if (*(void *)(a1 + 16) && (unint64_t v70 = sub_1000237B4(v68, v69), (v71 & 1) != 0))
  {
    sub_10001DE84(*(void *)(a1 + 56) + 32 * v70, (uint64_t)&v121);
  }
  else
  {
    long long v121 = 0u;
    long long v122 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v122 + 1))
  {
    if (swift_dynamicCast())
    {
      if (!v102)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000327C0();
        sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v115, v81);
      }
      uint64_t v72 = v119;
      unint64_t v73 = sub_10001EC38(v99, v102);
      if (v74)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000327C0();
        sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
      }
      else
      {
        uint64_t v75 = (char *)v73;
        if (!v67)
        {
          uint64_t v116 = v72;
          uint64_t v112 = 0;
          uint64_t v77 = (uint64_t)v110;
          goto LABEL_88;
        }
        uint64_t v76 = sub_10001EEAC(v98, v67);
        uint64_t v77 = (uint64_t)v110;
        if ((v78 & 1) == 0)
        {
          uint64_t v112 = v76;
          uint64_t v116 = v72;
LABEL_88:
          uint64_t v82 = sub_100032870();
          if (*(void *)(a1 + 16) && (unint64_t v84 = sub_1000237B4(v82, v83), (v85 & 1) != 0))
          {
            sub_10001DE84(*(void *)(a1 + 56) + 32 * v84, (uint64_t)&v121);
          }
          else
          {
            long long v121 = 0u;
            long long v122 = 0u;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*((void *)&v122 + 1))
          {
            sub_10000CE90(&qword_100043530);
            char v86 = swift_dynamicCast();
            uint64_t v87 = v123;
            uint64_t v88 = v111;
            if (v86)
            {
              FileTransferAttribute.ImageInfo.init(imageDict:)(v119, v77);
              if (v87)
              {
                (*(void (**)(char *, uint64_t))(v114 + 8))(v115, v113);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                return swift_bridgeObjectRelease();
              }
              uint64_t v110 = v75;
              uint64_t v123 = 0;
              sub_10000FAE8(v77, v88, &qword_100043510);
              goto LABEL_100;
            }
          }
          else
          {
            sub_10000F0CC((uint64_t)&v121, &qword_100043520);
            uint64_t v88 = v111;
          }
          uint64_t v110 = v75;
          uint64_t v89 = sub_1000325F0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v88, 1, 1, v89);
LABEL_100:
          sub_10000F068(v88, v106, &qword_100043510);
          uint64_t v90 = v114;
          uint64_t v91 = v115;
          uint64_t v92 = v113;
          (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v105, v115, v113);
          long long v93 = v109;
          uint64_t v94 = v123;
          sub_1000325D0();
          if (v94)
          {
            sub_10000F0CC(v111, &qword_100043510);
            return (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v91, v92);
          }
          sub_10000F0CC(v111, &qword_100043510);
          (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v92);
          uint64_t v39 = v117;
          uint64_t v38 = v118;
          (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v118, v93, v117);
          uint64_t v37 = 0;
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v38, v37, 1, v39);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000327C0();
        sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
      }
      sub_1000327B0();
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v114 + 8))(v115, v113);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000F0CC((uint64_t)&v121, &qword_100043520);
  }
  sub_1000327C0();
  sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
  swift_allocError();
  sub_1000327B0();
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v79, v81);
}

uint64_t sub_100021254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for Key(0);
  sub_100023B70(&qword_1000430C8, type metadata accessor for Key);
  uint64_t v9 = sub_100032820();
  v8(v9, a3, a4, a5);

  return swift_bridgeObjectRelease();
}

uint64_t AudioMessageAttachmentInfo.init(audioMessageDict:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100032670();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032870();
  if (!*(void *)(a1 + 16) || (unint64_t v11 = sub_1000237B4(v9, v10), (v12 & 1) == 0))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_10001DE84(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    sub_10000F0CC((uint64_t)&v20, &qword_100043520);
LABEL_10:
    uint64_t v17 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v17, 1, v5);
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v22 = v19;
  uint64_t v13 = sub_100032870();
  if (*(void *)(a1 + 16) && (unint64_t v15 = sub_1000237B4(v13, v14), (v16 & 1) != 0))
  {
    sub_10001DE84(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v20);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v21 + 1)) {
    swift_dynamicCast();
  }
  else {
    sub_10000F0CC((uint64_t)&v20, &qword_100043520);
  }
  uint64_t result = sub_100032660();
  if (!v2)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    uint64_t v17 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v17, 1, v5);
  }
  return result;
}

void *sub_1000215A4(uint64_t a1)
{
  uint64_t v3 = sub_1000325B0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v16 - v8;
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return &_swiftEmptyArrayStorage;
  }
  v16[0] = v4 + 8;
  v16[1] = v4 + 32;
  swift_bridgeObjectRetain();
  uint64_t v10 = 0;
  unint64_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v17 = v7;
  uint64_t v18 = a1;
  while (1)
  {
    uint64_t v12 = swift_bridgeObjectRetain();
    FileTransferAttribute.AttachmentInfo.init(attributes:)(v12);
    if (v1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v11 = (void *)sub_100030424(0, v11[2] + 1, 1, (unint64_t)v11);
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1) {
      unint64_t v11 = (void *)sub_100030424(v13 > 1, v14 + 1, 1, (unint64_t)v11);
    }
    ++v10;
    v11[2] = v14 + 1;
    uint64_t v7 = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v11+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v14, v17, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    if (v19 == v10)
    {
      swift_bridgeObjectRelease();
      return v11;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t FileTransferAttribute.ImageInfo.init(imageDict:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000325F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100032870();
  if (!*(void *)(a1 + 16) || (unint64_t v11 = sub_1000237B4(v9, v10), (v12 & 1) == 0))
  {
    long long v46 = 0u;
    long long v47 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_10001DE84(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v46);
  swift_bridgeObjectRelease();
  if (!*((void *)&v47 + 1)) {
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v13 = v45;
  unint64_t v42 = (unint64_t)v44;
  uint64_t v14 = sub_100032870();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_1000237B4(v14, v15), (v17 & 1) != 0))
  {
    sub_10001DE84(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v47 + 1))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    sub_10000F0CC((uint64_t)&v46, &qword_100043520);
LABEL_10:
    uint64_t v18 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
  }
  uint64_t v20 = swift_dynamicCast();
  if ((v20 & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  long long v21 = v44;
  uint64_t v41 = v45;
  uint64_t v44 = 0;
  uint64_t v22 = __chkstk_darwin(v20);
  *(&v40 - 2) = (uint64_t)&v44;
  if ((v13 & 0x1000000000000000) != 0 || !(v13 & 0x2000000000000000 | v42 & 0x1000000000000000))
  {
    uint64_t v40 = (uint64_t)v21;
    sub_100032BA0();
    uint64_t v28 = swift_bridgeObjectRelease();
    if ((v43 & 1) == 0) {
      goto LABEL_36;
    }
  }
  else
  {
    __chkstk_darwin(v22);
    *(&v40 - 2) = (uint64_t)sub_100023970;
    *(&v40 - 1) = v24;
    if ((v13 & 0x2000000000000000) != 0)
    {
      *(void *)&long long v46 = v23;
      *((void *)&v46 + 1) = v13 & 0xFFFFFFFFFFFFFFLL;
      if (v23 <= 0x20u && ((1 << v23) & 0x100003E01) != 0
        || (int64_t v36 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      uint64_t v40 = (uint64_t)v21;
      int v37 = *v36;
      uint64_t v28 = swift_bridgeObjectRelease();
      if (v37) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v40 = (uint64_t)v21;
      if ((v23 & 0x1000000000000000) != 0)
      {
        uint64_t v25 = (v13 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v25 = sub_100032BF0();
      }
      char v27 = sub_100023910(v25, v26, (void (*)(uint64_t *__return_ptr))sub_1000239F8);
      uint64_t v28 = swift_bridgeObjectRelease();
      if ((v27 & 1) == 0) {
        goto LABEL_36;
      }
    }
  }
  uint64_t v44 = 0;
  uint64_t v29 = __chkstk_darwin(v28);
  *(&v40 - 2) = (uint64_t)&v44;
  uint64_t v30 = v41;
  if ((v41 & 0x1000000000000000) != 0 || !(v41 & 0x2000000000000000 | v40 & 0x1000000000000000))
  {
    sub_100032BA0();
    swift_bridgeObjectRelease();
    if (v43) {
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  __chkstk_darwin(v29);
  *(&v40 - 2) = (uint64_t)sub_100023970;
  *(&v40 - 1) = v32;
  if ((v30 & 0x2000000000000000) != 0)
  {
    *(void *)&long long v46 = v31;
    *((void *)&v46 + 1) = v30 & 0xFFFFFFFFFFFFFFLL;
    if (v31 > 0x20u || ((1 << v31) & 0x100003E01) == 0)
    {
      uint64_t v38 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
      if (v38)
      {
        int v39 = *v38;
        swift_bridgeObjectRelease();
        if (!v39) {
          goto LABEL_29;
        }
LABEL_37:
        sub_1000327C0();
        sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        return swift_willThrow();
      }
    }
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  unint64_t v42 = (unint64_t)&v40;
  if ((v31 & 0x1000000000000000) != 0)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v33 = sub_100032BF0();
  }
  char v35 = sub_100023910(v33, v34, (void (*)(uint64_t *__return_ptr))sub_1000239F8);
  swift_bridgeObjectRelease();
  if ((v35 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  uint64_t result = sub_1000325E0();
  if (!v2)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    uint64_t v18 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
  }
  return result;
}

uint64_t FileTransferAttribute.AttachmentInfo.init(attributes:)(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_100043538);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031F40();
  uint64_t v70 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v57 - v9;
  uint64_t v11 = sub_100032870();
  if (!*(void *)(a1 + 16) || (unint64_t v13 = sub_1000237B4(v11, v12), (v14 & 1) == 0))
  {
    long long v67 = 0u;
    long long v68 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10001DE84(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v67);
  swift_bridgeObjectRelease();
  if (!*((void *)&v68 + 1))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_10000F0CC((uint64_t)&v67, &qword_100043520);
    sub_100032870();
    sub_1000327C0();
    sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    return swift_willThrow();
  }
  sub_100023A54(&v67, v69);
  sub_10001DE84((uint64_t)v69, (uint64_t)&v67);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_100031F30();
  swift_bridgeObjectRelease();
  uint64_t v15 = v70;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v4, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v10, v4, v5);
    uint64_t v17 = sub_100032870();
    if (*(void *)(a1 + 16) && (unint64_t v19 = sub_1000237B4(v17, v18), (v20 & 1) != 0))
    {
      sub_10001DE84(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v67);
    }
    else
    {
      long long v67 = 0u;
      long long v68 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v68 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v62 = v65;
        uint64_t v21 = sub_100032870();
        if (*(void *)(a1 + 16) && (unint64_t v23 = sub_1000237B4(v21, v22), (v24 & 1) != 0))
        {
          sub_10001DE84(*(void *)(a1 + 56) + 32 * v23, (uint64_t)&v67);
        }
        else
        {
          long long v67 = 0u;
          long long v68 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v68 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v25 = *((void *)&v65 + 1);
            uint64_t v60 = v65;
            uint64_t v61 = MBDIMFileTransferSizeKey;
            uint64_t v26 = sub_100032870();
            if (*(void *)(a1 + 16) && (unint64_t v28 = sub_1000237B4(v26, v27), (v29 & 1) != 0))
            {
              sub_10001DE84(*(void *)(a1 + 56) + 32 * v28, (uint64_t)&v65);
            }
            else
            {
              long long v65 = 0u;
              long long v66 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v66 + 1))
            {
              sub_100023A54(&v65, &v67);
              sub_10001DE84((uint64_t)&v67, (uint64_t)&v65);
              if ((swift_dynamicCast() & 1) == 0)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_81:
                swift_bridgeObjectRelease();
                uint64_t v47 = v70;
                sub_100032870();
                sub_1000327C0();
                sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
                swift_allocError();
                sub_1000327B0();
                swift_willThrow();
                sub_1000136B4((uint64_t)&v67);
                (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v5);
                return sub_1000136B4((uint64_t)v69);
              }
              unint64_t v31 = HIBYTE(v64) & 0xF;
              uint64_t v32 = v63 & 0xFFFFFFFFFFFFLL;
              if ((v64 & 0x2000000000000000) != 0) {
                unint64_t v33 = HIBYTE(v64) & 0xF;
              }
              else {
                unint64_t v33 = v63 & 0xFFFFFFFFFFFFLL;
              }
              if (!v33)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_80:
                swift_bridgeObjectRelease();
                goto LABEL_81;
              }
              if ((v64 & 0x1000000000000000) != 0)
              {
                uint64_t v58 = sub_100022CD8(v63, v64, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_100022DD0);
                int v59 = v56;
                goto LABEL_75;
              }
              if ((v64 & 0x2000000000000000) == 0)
              {
                if ((v63 & 0x1000000000000000) != 0) {
                  uint64_t v34 = (unsigned __int8 *)((v64 & 0xFFFFFFFFFFFFFFFLL) + 32);
                }
                else {
                  uint64_t v34 = (unsigned __int8 *)sub_100032BF0();
                }
                uint64_t v58 = (uint64_t)sub_100022DD0(v34, v32, 10);
                LODWORD(v31) = v35 & 1;
                goto LABEL_74;
              }
              *(void *)&long long v65 = v63;
              *((void *)&v65 + 1) = v64 & 0xFFFFFFFFFFFFFFLL;
              if (v63 == 43)
              {
                if (!v31) {
                  goto LABEL_116;
                }
                if (v31 == 1) {
                  goto LABEL_114;
                }
                if ((BYTE1(v63) - 48) > 9u) {
                  goto LABEL_72;
                }
                unint64_t v39 = (BYTE1(v63) - 48);
                if (v31 == 2) {
                  goto LABEL_90;
                }
                if ((BYTE2(v63) - 48) > 9u) {
                  goto LABEL_72;
                }
                uint64_t v58 = 10 * (BYTE1(v63) - 48) + (BYTE2(v63) - 48);
                unint64_t v40 = v31 - 3;
                if (v40)
                {
                  uint64_t v41 = (unsigned __int8 *)&v65 + 3;
                  while (1)
                  {
                    unsigned int v42 = *v41 - 48;
                    if (v42 > 9) {
                      goto LABEL_72;
                    }
                    if (!is_mul_ok(v58, 0xAuLL)) {
                      goto LABEL_72;
                    }
                    BOOL v37 = __CFADD__(10 * v58, v42);
                    uint64_t v58 = 10 * v58 + v42;
                    if (v37) {
                      goto LABEL_72;
                    }
                    int v59 = 0;
                    ++v41;
                    if (!--v40) {
                      goto LABEL_75;
                    }
                  }
                }
              }
              else
              {
                if (v63 == 45)
                {
                  if (v31)
                  {
                    if (v31 != 1)
                    {
                      unsigned __int8 v36 = BYTE1(v63) - 48;
                      if ((BYTE1(v63) - 48) <= 9u)
                      {
                        unint64_t v30 = 0;
                        BOOL v37 = v36 == 0;
                        unint64_t v38 = -(uint64_t)v36;
                        if (!v37) {
                          goto LABEL_117;
                        }
                        if (v31 == 2)
                        {
                          int v59 = 0;
                          uint64_t v58 = v38;
LABEL_75:
                          swift_bridgeObjectRelease();
                          if ((v59 & 1) == 0)
                          {
                            uint64_t v61 = v25;
                            uint64_t v43 = sub_100032870();
                            if (*(void *)(a1 + 16) && (unint64_t v45 = sub_1000237B4(v43, v44), (v46 & 1) != 0))
                            {
                              sub_10001DE84(*(void *)(a1 + 56) + 32 * v45, (uint64_t)&v65);
                            }
                            else
                            {
                              long long v65 = 0u;
                              long long v66 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            if (*((void *)&v66 + 1))
                            {
                              if (swift_dynamicCast())
                              {
                                uint64_t v15 = v70;
                                (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v8, v10, v5);
                                sub_1000325A0();
                                sub_1000136B4((uint64_t)&v67);
                                goto LABEL_24;
                              }
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              sub_10000F0CC((uint64_t)&v65, &qword_100043520);
                            }
                            sub_100032870();
                            sub_1000327C0();
                            sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
                            swift_allocError();
                            sub_1000327B0();
                            swift_willThrow();
                            sub_1000136B4((uint64_t)&v67);
LABEL_34:
                            (*(void (**)(char *, uint64_t))(v70 + 8))(v10, v5);
                            return sub_1000136B4((uint64_t)v69);
                          }
                          swift_bridgeObjectRelease();
                          goto LABEL_80;
                        }
                        unsigned __int8 v51 = BYTE2(v63) - 48;
                        if ((BYTE2(v63) - 48) <= 9u && is_mul_ok(v38, 0xAuLL))
                        {
                          unint64_t v52 = 10 * v38;
                          uint64_t v58 = v52 - v51;
                          if (v52 >= v51)
                          {
                            unint64_t v53 = v31 - 3;
                            if (!v53) {
                              goto LABEL_103;
                            }
                            char v54 = (unsigned __int8 *)&v65 + 3;
                            while (1)
                            {
                              unsigned int v55 = *v54 - 48;
                              if (v55 > 9) {
                                break;
                              }
                              if (!is_mul_ok(v58, 0xAuLL)) {
                                break;
                              }
                              BOOL v37 = 10 * v58 >= (unint64_t)v55;
                              uint64_t v58 = 10 * v58 - v55;
                              if (!v37) {
                                break;
                              }
                              int v59 = 0;
                              ++v54;
                              if (!--v53) {
                                goto LABEL_75;
                              }
                            }
                          }
                        }
                      }
LABEL_72:
                      uint64_t v58 = 0;
LABEL_73:
                      LODWORD(v31) = 1;
LABEL_74:
                      int v59 = v31;
                      goto LABEL_75;
                    }
LABEL_114:
                    uint64_t v58 = 0;
                    goto LABEL_74;
                  }
                  __break(1u);
LABEL_116:
                  __break(1u);
LABEL_117:
                  uint64_t v58 = v30;
                  goto LABEL_73;
                }
                if (!v31 || (v63 - 48) > 9u) {
                  goto LABEL_72;
                }
                unint64_t v39 = (v63 - 48);
                if (v31 == 1)
                {
LABEL_90:
                  uint64_t v58 = v39;
                  int v59 = 0;
                  goto LABEL_75;
                }
                if ((BYTE1(v63) - 48) > 9u) {
                  goto LABEL_72;
                }
                uint64_t v58 = 10 * (v63 - 48) + (BYTE1(v63) - 48);
                unint64_t v48 = v31 - 2;
                if (v48)
                {
                  uint64_t v49 = (unsigned __int8 *)&v65 + 2;
                  while (1)
                  {
                    unsigned int v50 = *v49 - 48;
                    if (v50 > 9) {
                      goto LABEL_72;
                    }
                    if (!is_mul_ok(v58, 0xAuLL)) {
                      goto LABEL_72;
                    }
                    BOOL v37 = __CFADD__(10 * v58, v50);
                    uint64_t v58 = 10 * v58 + v50;
                    if (v37) {
                      goto LABEL_72;
                    }
                    int v59 = 0;
                    ++v49;
                    if (!--v48) {
                      goto LABEL_75;
                    }
                  }
                }
              }
LABEL_103:
              int v59 = 0;
              goto LABEL_75;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10000F0CC((uint64_t)&v65, &qword_100043520);
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10000F0CC((uint64_t)&v67, &qword_100043520);
        }
        sub_100032870();
        sub_1000327C0();
        sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        swift_willThrow();
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10000F0CC((uint64_t)&v67, &qword_100043520);
    }
    sub_100032870();
    sub_1000327C0();
    sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();
LABEL_24:
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v5);
    return sub_1000136B4((uint64_t)v69);
  }
  swift_bridgeObjectRelease();
  sub_10000F0CC((uint64_t)v4, &qword_100043538);
LABEL_10:
  sub_100032870();
  sub_1000327C0();
  sub_100023B70((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
  swift_allocError();
  sub_1000327B0();
  swift_willThrow();
  return sub_1000136B4((uint64_t)v69);
}

uint64_t sub_100022C44()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001F110(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(char ***)(v4 + 40));
}

uint64_t sub_100022C88()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022C98()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100022CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100022CD0()
{
  return swift_release();
}

uint64_t sub_100022CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100032960();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = &v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_1000232C8();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (void *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (void *)sub_100032BF0();
  }
LABEL_7:
  uint64_t v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_100022DD0(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  char v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_10002304C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unsigned __int8 v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1000232C8()
{
  unint64_t v0 = sub_100032970();
  uint64_t v4 = sub_100023348(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100023348(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1000234A0(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10001DC50(v9, 0),
          unint64_t v12 = sub_1000235A0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_1000328D0();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_1000328D0();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100032BF0();
LABEL_4:

  return sub_1000328D0();
}

uint64_t sub_1000234A0(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10001DCB8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10001DCB8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_1000235A0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10001DCB8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_100032940();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_100032BF0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_10001DCB8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_100032910();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1000237B4(uint64_t a1, uint64_t a2)
{
  sub_100032DE0();
  sub_1000328E0();
  Swift::Int v4 = sub_100032E00();

  return sub_10002382C(a1, a2, v4);
}

unint64_t sub_10002382C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100032D70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100032D70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100023910(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_100023970@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_100023988(a1, a2);
}

unsigned char *sub_100023988@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_1000239F8@<X0>(unsigned char *a1@<X8>)
{
  return sub_100023A10(a1);
}

void *sub_100023A10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

_OWORD *sub_100023A54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100023A64(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100023A7C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t *sub_100023AB8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100023B1C(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_100023B70(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicVideoPreviewUnpacker()
{
  return &type metadata for BasicVideoPreviewUnpacker;
}

uint64_t sub_100023BC8()
{
  return sub_10002DE3C(&qword_100043580, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
}

uint64_t sub_100023C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v5 = sub_10000CE90(&qword_100043588);
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  __chkstk_darwin(v5);
  unint64_t v38 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032730();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100031F40();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100032700();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v17 = sub_100032A50();
  sub_100023A7C(0, (unint64_t *)&qword_100043188);
  unint64_t v18 = sub_100032B30();
  char v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v37 = a1;
  v19(v16, a1, v13);
  os_log_type_t v20 = v17;
  if (os_log_type_enabled(v18, v17))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v43 = v31;
    uint64_t v32 = a3;
    *(_DWORD *)uint64_t v21 = 136446210;
    v29[1] = v21 + 4;
    char v30 = v21;
    sub_1000326F0();
    sub_100032720();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v34);
    sub_10002DE3C(&qword_100043598, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v22 = v36;
    uint64_t v23 = sub_100032D60();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v22);
    uint64_t v42 = sub_10001D7B0(v23, v25, &v43);
    sub_100032B80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    _os_log_impl((void *)&_mh_execute_header, v18, v20, "BlastDoor processing thumbnail for video: %{public}s)", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  __chkstk_darwin(v26);
  uint64_t v27 = v39;
  v29[-2] = v37;
  v29[-1] = v27;
  sub_10000CE90(&qword_100043590);
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v38, enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:), v41);
  return sub_1000329E0();
}

uint64_t sub_1000240F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = a3;
  uint64_t v30 = a1;
  uint64_t v27 = a2;
  uint64_t v31 = sub_10000CE90(&qword_1000435A0);
  uint64_t v3 = *(void *)(v31 - 8);
  uint64_t v28 = *(void *)(v3 + 64);
  __chkstk_darwin(v31);
  uint64_t v26 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032330();
  uint64_t v24 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  unint64_t v25 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032700();
  uint64_t v23 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000CE90(&qword_1000435A8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000329B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v5);
  uint64_t v16 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v26, v30, v31);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (v10 + *(unsigned __int8 *)(v6 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v19 = (v7 + *(unsigned __int8 *)(v3 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v17, v11, v23);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v18, v25, v24);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v20 + v19, v16, v31);
  sub_10002D150((uint64_t)v14, (uint64_t)&unk_1000435B8, v20);
  return swift_release();
}

uint64_t sub_10002446C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  uint64_t v7 = sub_10000CE90(&qword_1000435A0);
  v6[8] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[9] = v8;
  v6[10] = *(void *)(v8 + 64);
  v6[11] = swift_task_alloc();
  uint64_t v9 = sub_100032330();
  v6[12] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[13] = v10;
  v6[14] = *(void *)(v10 + 64);
  v6[15] = swift_task_alloc();
  uint64_t v11 = sub_100032730();
  v6[16] = v11;
  v6[17] = *(void *)(v11 - 8);
  v6[18] = swift_task_alloc();
  uint64_t v12 = sub_100031F40();
  v6[19] = v12;
  v6[20] = *(void *)(v12 - 8);
  v6[21] = swift_task_alloc();
  uint64_t v13 = sub_100032700();
  v6[22] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[23] = v14;
  v6[24] = *(void *)(v14 + 64);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return _swift_task_switch(sub_1000246CC, 0, 0);
}

uint64_t sub_1000246CC()
{
  unint64_t v48 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[23];
  os_log_type_t v5 = sub_100032A50();
  v0[27] = sub_100023A7C(0, (unint64_t *)&qword_100043188);
  uint64_t v6 = sub_100032B30();
  char v46 = *(void (**)(void))(v4 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v46)(v2, v1, v3);
  os_log_type_t v7 = v5;
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v8 = v0[26];
    uint64_t v9 = v0[21];
    uint64_t v40 = v0[23];
    uint64_t v42 = v0[22];
    uint64_t v10 = v0[20];
    uint64_t v36 = v0[19];
    uint64_t v11 = v0[17];
    uint64_t v12 = v0[18];
    uint64_t v35 = v0[16];
    os_log_type_t type = v7;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446210;
    sub_1000326F0();
    sub_100032720();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v35);
    sub_10002DE3C(&qword_100043598, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v14 = sub_100032D60();
    unint64_t v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v36);
    v0[4] = sub_10001D7B0(v14, v16, &v47);
    sub_100032B80();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v8, v42);
    _os_log_impl((void *)&_mh_execute_header, v6, type, "Task running for video: %{public}s)", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v17 = v0[26];
    uint64_t v18 = v0[22];
    uint64_t v19 = v0[23];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  uint64_t v20 = v0[23];
  uint64_t v39 = v0[22];
  uint64_t v41 = v0[25];
  uint64_t v21 = v0[15];
  uint64_t v37 = v0[24];
  buf = (uint8_t *)v0[14];
  uint64_t v23 = v0[12];
  uint64_t v22 = v0[13];
  uint64_t v24 = v0[11];
  uint64_t v25 = v0[8];
  uint64_t v26 = v0[9];
  uint64_t v43 = v25;
  *(void *)typea = v24;
  uint64_t v28 = v0[6];
  uint64_t v27 = v0[7];
  v46();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v28, v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v27, v25);
  unint64_t v29 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v30 = (v37 + *(unsigned __int8 *)(v22 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v31 = (unint64_t)&buf[*(unsigned __int8 *)(v26 + 80) + v30] & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v32 = swift_allocObject();
  v0[28] = v32;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v32 + v29, v41, v39);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(v32 + v30, v21, v23);
  (*(void (**)(unint64_t, os_log_type_t *, uint64_t))(v26 + 32))(v32 + v31, *(os_log_type_t **)typea, v43);
  uint64_t v33 = (void *)swift_task_alloc();
  v0[29] = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_100024B1C;
  return File.withResource<A>(_:)();
}

uint64_t sub_100024B1C()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100024CE0;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100024C38;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100024C38()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100024CE0()
{
  swift_release();
  os_log_type_t v1 = sub_100032A60();
  uint64_t v2 = sub_100032B30();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v6;
    sub_100032B80();
    *os_log_type_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Caught error: %@", v4, 0xCu);
    sub_10000CE90(&qword_1000435E0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v7 = v0[30];

  v0[2] = v7;
  sub_1000329D0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100024EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[132] = a4;
  v4[131] = a3;
  v4[130] = a2;
  sub_10000CE90(&qword_100043590);
  v4[133] = swift_task_alloc();
  uint64_t v5 = sub_10000CE90(&qword_1000435E8);
  v4[134] = v5;
  v4[135] = *(void *)(v5 - 8);
  v4[136] = swift_task_alloc();
  uint64_t v6 = sub_1000323F0();
  v4[137] = v6;
  v4[138] = *(void *)(v6 - 8);
  v4[139] = swift_task_alloc();
  v4[140] = swift_task_alloc();
  uint64_t v7 = sub_100032310();
  v4[141] = v7;
  v4[142] = *(void *)(v7 - 8);
  v4[143] = swift_task_alloc();
  v4[144] = swift_task_alloc();
  uint64_t v8 = sub_1000322F0();
  v4[145] = v8;
  v4[146] = *(void *)(v8 - 8);
  v4[147] = swift_task_alloc();
  v4[148] = swift_task_alloc();
  sub_10000CE90(&qword_1000435F0);
  v4[149] = swift_task_alloc();
  uint64_t v9 = sub_100032770();
  v4[150] = v9;
  v4[151] = *(void *)(v9 - 8);
  v4[152] = swift_task_alloc();
  v4[153] = swift_task_alloc();
  uint64_t v10 = sub_100032A30();
  v4[154] = v10;
  v4[155] = *(void *)(v10 - 8);
  v4[156] = swift_task_alloc();
  v4[157] = swift_task_alloc();
  uint64_t v11 = sub_1000323B0();
  v4[158] = v11;
  v4[159] = *(void *)(v11 - 8);
  v4[160] = swift_task_alloc();
  v4[161] = swift_task_alloc();
  v4[162] = swift_task_alloc();
  v4[163] = swift_task_alloc();
  v4[164] = swift_task_alloc();
  uint64_t v12 = sub_1000323D0();
  v4[165] = v12;
  v4[166] = *(void *)(v12 - 8);
  v4[167] = swift_task_alloc();
  uint64_t v13 = sub_100032340();
  v4[168] = v13;
  v4[169] = *(void *)(v13 - 8);
  v4[170] = swift_task_alloc();
  v4[171] = swift_task_alloc();
  v4[172] = swift_task_alloc();
  v4[173] = swift_task_alloc();
  v4[174] = swift_task_alloc();
  uint64_t v14 = sub_100031F40();
  v4[175] = v14;
  v4[176] = *(void *)(v14 - 8);
  v4[177] = swift_task_alloc();
  uint64_t v15 = sub_100032730();
  v4[178] = v15;
  v4[179] = *(void *)(v15 - 8);
  v4[180] = swift_task_alloc();
  return _swift_task_switch(sub_100025470, 0, 0);
}

uint64_t sub_100025470()
{
  uint64_t v1 = v0[180];
  uint64_t v2 = v0[179];
  uint64_t v3 = v0[178];
  uint64_t v4 = v0[177];
  uint64_t v5 = v0[176];
  uint64_t v15 = v0[175];
  sub_1000326F0();
  sub_100032720();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[181] = sub_10000CE90(&qword_1000435F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100037F60;
  *(void *)(inited + 32) = sub_100032870();
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  sub_10002CF48(inited);
  id v8 = objc_allocWithZone((Class)AVURLAsset);
  sub_100031F20(v9);
  uint64_t v11 = v10;
  Class isa = sub_100032810().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v8 initWithURL:v11 options:isa];
  v0[182] = v13;

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v15);
  v0[2] = v0;
  v0[7] = v0 + 129;
  v0[3] = sub_100025700;
  v0[82] = swift_continuation_init();
  v0[78] = _NSConcreteStackBlock;
  v0[79] = 0x40000000;
  v0[80] = sub_10002D074;
  v0[81] = &unk_10003E5F0;
  [v13 loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v0 + 78];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100025700()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 1464) = v1;
  if (v1) {
    uint64_t v2 = sub_10002B01C;
  }
  else {
    uint64_t v2 = sub_10002583C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002583C()
{
  unint64_t v1 = *(void *)(v0 + 1032);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 1472) = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_22:
    unint64_t v48 = *(void **)(v0 + 1456);
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_100032C10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100032C10();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 1472) = v47;
  if (!v2) {
    goto LABEL_22;
  }
LABEL_3:
  unint64_t v3 = v2 - 1;
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
  }
  else if ((v1 & 0xC000000000000001) == 0)
  {
    if ((v3 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v3 < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v4 = *(id *)(v1 + 8 * v3 + 32);
      goto LABEL_8;
    }
    __break(1u);
  }
  id v4 = (id)sub_100032BD0();
LABEL_8:
  uint64_t v5 = v4;
  *(void *)(v0 + 1480) = v4;
  uint64_t v6 = *(void *)(v0 + 1392);
  uint64_t v7 = *(void *)(v0 + 1352);
  uint64_t v8 = *(void *)(v0 + 1344);
  swift_bridgeObjectRelease();
  id v9 = v5;
  sub_100032320();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 88);
  *(void *)(v0 + 1488) = v10;
  *(void *)(v0 + 1496) = (v7 + 88) & 0xFFFFFFFFFFFFLL | 0xA3B5000000000000;
  int v11 = v10(v6, v8);
  *(_DWORD *)(v0 + 1780) = v11;
  int v12 = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
  *(_DWORD *)(v0 + 1784) = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
  if (v11 == v12)
  {
    uint64_t v13 = *(void *)(v0 + 1392);
    uint64_t v14 = *(void *)(v0 + 1344);
    uint64_t v15 = *(void *)(v0 + 1336);
    uint64_t v16 = *(void *)(v0 + 1328);
    uint64_t v17 = *(void *)(v0 + 1320);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1352) + 96);
    *(void *)(v0 + 1504) = v18;
    v18(v13, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v15, v13, v17);
    sub_10000CE90(&qword_100043630);
    uint64_t v19 = sub_100031FB0();
    *(void *)(v0 + 1512) = v19;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 1520) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_1000260EC;
    return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 936, v19);
  }
  if (v11 == enum case for VideoPreview.FrameConstraints.multiFrame(_:))
  {
    uint64_t v21 = *(void *)(v0 + 1392);
    uint64_t v22 = *(void *)(v0 + 1312);
    uint64_t v23 = *(void *)(v0 + 1304);
    uint64_t v24 = *(void *)(v0 + 1272);
    uint64_t v25 = *(void *)(v0 + 1264);
    uint64_t v26 = *(void (**)(uint64_t, void))(*(void *)(v0 + 1352) + 96);
    v26(v21, *(void *)(v0 + 1344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v22, v21, v25);
    uint64_t v27 = sub_100032380();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v22, v25);
    uint64_t v28 = *(void *)(v0 + 1304);
    uint64_t v29 = *(void *)(v0 + 1272);
    uint64_t v30 = *(void *)(v0 + 1264);
    if (v27 < 1)
    {
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v32(*(void *)(v0 + 1304), *(void *)(v0 + 1264));
    }
    else
    {
      uint64_t v31 = sub_100032390();
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v32(v28, v30);
      if (v31 > 0)
      {
        uint64_t v33 = *(void *)(v0 + 1312);
        uint64_t v34 = *(void *)(v0 + 1264);
        double v35 = (double)sub_100032380();
        double v36 = (double)sub_100032390();
        uint64_t v37 = sub_100032350();
        v32(v33, v34);
        *(double *)(v0 + 1600) = v35;
        *(double *)(v0 + 1592) = v36;
        *(void *)(v0 + 1584) = v37;
        *(void *)(v0 + 1576) = v26;
        unint64_t v38 = (void *)swift_task_alloc();
        *(void *)(v0 + 1608) = v38;
        *unint64_t v38 = v0;
        v38[1] = sub_1000267C8;
        uint64_t v39 = *(void *)(v0 + 1256);
        return AVAssetTrack.info.getter(v39);
      }
    }
    uint64_t v44 = *(void **)(v0 + 1456);
    uint64_t v45 = *(void *)(v0 + 1312);
    uint64_t v46 = *(void *)(v0 + 1264);
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    v32(v45, v46);
  }
  else
  {
    uint64_t v40 = *(void **)(v0 + 1456);
    uint64_t v41 = *(void *)(v0 + 1392);
    uint64_t v42 = *(void *)(v0 + 1352);
    uint64_t v43 = *(void *)(v0 + 1344);
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  }
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_1000260EC()
{
  *(void *)(*(void *)v1 + 1528) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10002B230;
  }
  else {
    uint64_t v2 = sub_10002624C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002624C()
{
  *(_OWORD *)(v0 + 1536) = *(_OWORD *)(v0 + 936);
  sub_10000CE90(&qword_100043638);
  uint64_t v1 = sub_100031FD0();
  *(void *)(v0 + 1552) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 1560) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100026348;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 528, v1);
}

uint64_t sub_100026348()
{
  *(void *)(*(void *)v1 + 1568) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10002B46C;
  }
  else {
    uint64_t v2 = sub_1000264A8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000264A8()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(v0 + 1544);
  uint64_t v2 = *(void *)(v0 + 1536);
  long long v3 = *(_OWORD *)(v0 + 544);
  long long v4 = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 528);
  *(_OWORD *)(v0 + 448) = v3;
  *(_OWORD *)(v0 + 464) = v4;
  uint64_t v5 = 0;
  *(void *)&long long v3 = 0;
  CGRect v31 = CGRectApplyAffineTransform(*(CGRect *)(&v1 - 3), (CGAffineTransform *)(v0 + 432));
  double width = v31.size.width;
  double height = v31.size.height;
  double v8 = (double)sub_1000323C0();
  double v9 = fmin(width / height, 1.77777778);
  if (width / height < 0.75) {
    double v10 = 0.75;
  }
  else {
    double v10 = v9;
  }
  double v11 = ceil(v8 / v10);
  if (height == 0.0 || width == 0.0)
  {
    os_log_type_t v13 = sub_100032A50();
    sub_100023A7C(0, (unint64_t *)&qword_100043188);
    uint64_t v14 = sub_100032B30();
    os_log_type_t v15 = v13;
    BOOL v16 = os_log_type_enabled(v14, v13);
    uint64_t v17 = *(void *)(v0 + 1336);
    uint64_t v18 = *(void *)(v0 + 1328);
    uint64_t v19 = *(void *)(v0 + 1320);
    if (v16)
    {
      uint64_t v27 = *(void *)(v0 + 1336);
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      *(double *)(v0 + 952) = v8;
      *(double *)(v0 + 960) = v11;
      type metadata accessor for CGSize(0);
      uint64_t v21 = sub_1000328B0();
      *(void *)(v0 + 984) = sub_10001D7B0(v21, v22, &v28);
      sub_100032B80();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "video size is zero, falling back to maxPtSize: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v27, v19);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
  }
  else
  {
    double v12 = v8 / width;
    if (v8 / width <= v11 / height) {
      double v12 = v11 / height;
    }
    double v8 = ceil(width * v12);
    double v11 = ceil(height * v12);
    (*(void (**)(void, void))(*(void *)(v0 + 1328) + 8))(*(void *)(v0 + 1336), *(void *)(v0 + 1320));
  }
  uint64_t v23 = *(void *)(v0 + 1504);
  *(double *)(v0 + 1600) = v8;
  *(double *)(v0 + 1592) = v11;
  *(void *)(v0 + 1584) = 0;
  *(void *)(v0 + 1576) = v23;
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 1608) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_1000267C8;
  uint64_t v25 = *(void *)(v0 + 1256);
  return AVAssetTrack.info.getter(v25);
}

uint64_t sub_1000267C8()
{
  *(void *)(*(void *)v1 + 1616) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10002B6A8;
  }
  else {
    uint64_t v2 = sub_100026908;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100026908()
{
  uint64_t v13 = v0;
  os_log_type_t v1 = sub_100032A50();
  *(void *)(v0 + 1624) = sub_100023A7C(0, (unint64_t *)&qword_100043188);
  uint64_t v2 = sub_100032B10();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = sub_1000329F0();
    *(void *)(v0 + 992) = sub_10001D7B0(v5, v6, &v12);
    sub_100032B80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v7 = sub_1000329F0();
    *(void *)(v0 + 1000) = sub_10001D7B0(v7, v8, &v12);
    sub_100032B80();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "thumbnailFitPxSize: %s x %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v9 = *(id *)(v0 + 1456);
  double v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 1632) = v10;
  *double v10 = v0;
  v10[1] = sub_100026B54;
  return AVAsset.isAutoLoop.getter();
}

uint64_t sub_100026B54(char a1)
{
  uint64_t v3 = *v2;
  *(unsigned char *)(v3 + 1804) = a1;
  *(void *)(v3 + 1640) = v1;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v4 = sub_10002B8C0;
  }
  else
  {
    uint64_t v4 = sub_100026CA8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100026CA8()
{
  uint64_t v1 = *(void **)(v0 + 1456);

  id v2 = objc_allocWithZone((Class)AVAssetReader);
  *(void *)(v0 + 1024) = 0;
  id v3 = [v2 initWithAsset:v1 error:v0 + 1024];
  *(void *)(v0 + 1648) = v3;
  uint64_t v4 = *(void **)(v0 + 1024);
  if (!v3)
  {
    uint64_t v43 = *(void **)(v0 + 1480);
    uint64_t v44 = *(void **)(v0 + 1456);
    uint64_t v45 = *(void *)(v0 + 1256);
    uint64_t v46 = *(void *)(v0 + 1240);
    uint64_t v47 = *(void *)(v0 + 1232);
    id v48 = v4;
    sub_100031F10();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);

    goto LABEL_66;
  }
  uint64_t v5 = *(void *)(v0 + 1600);
  uint64_t v6 = *(void **)(v0 + 1456);
  id v7 = v4;

  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000388F0;
  *(void *)(inited + 32) = sub_100032870();
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 72) = sub_10000CE90(&qword_100043600);
  *(void *)(inited + 48) = &off_10003DD10;
  *(void *)(inited + 80) = sub_100032870();
  *(void *)(inited + 88) = v10;
  if ((~v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_74;
  }
  double v11 = *(double *)(v0 + 1600);
  if (v11 <= -9.22337204e18)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v12 = *(void *)(v0 + 1592);
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = (uint64_t)v11;
  *(void *)(inited + 128) = sub_100032870();
  *(void *)(inited + 136) = v13;
  if ((~v12 & 0x7FF0000000000000) == 0)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  double v14 = *(double *)(v0 + 1592);
  if (v14 <= -9.22337204e18)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
  }
  os_log_type_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v16 = *(void *)(v0 + 1384);
  uint64_t v17 = *(void *)(v0 + 1344);
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = (uint64_t)v14;
  unint64_t v18 = sub_10002CF48(inited);
  sub_100032320();
  int v19 = v15(v16, v17);
  int v20 = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  *(_DWORD *)(v0 + 1788) = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  if (v19 == v20)
  {
    uint64_t v21 = *(void *)(v0 + 1384);
    uint64_t v22 = *(void *)(v0 + 1296);
    uint64_t v23 = *(void *)(v0 + 1272);
    uint64_t v24 = *(void *)(v0 + 1264);
    (*(void (**)(uint64_t, void))(v0 + 1576))(v21, *(void *)(v0 + 1344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v22, v21, v24);
    if (sub_100032360() >= 1)
    {
      uint64_t v25 = sub_100032870();
      uint64_t v27 = v26;
      uint64_t v28 = sub_100032360();
      *(void *)(v0 + 784) = &type metadata for Int;
      *(void *)(v0 + 760) = v28;
      sub_100023A54((_OWORD *)(v0 + 760), (_OWORD *)(v0 + 728));
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_10002E184((_OWORD *)(v0 + 728), v25, v27, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    *(void *)(v0 + 1656) = v18;
    uint64_t v30 = *(void *)(v0 + 1296);
    uint64_t v31 = *(void *)(v0 + 1288);
    uint64_t v32 = *(void *)(v0 + 1272);
    uint64_t v33 = *(void *)(v0 + 1264);
    uint64_t v34 = sub_100032350();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v30, v33);
    uint64_t v35 = *(void *)(v0 + 1288);
    uint64_t v36 = *(void *)(v0 + 1272);
    uint64_t v37 = *(void *)(v0 + 1264);
    if (v34 < 1)
    {
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v39(*(void *)(v0 + 1288), *(void *)(v0 + 1264));
    }
    else
    {
      char v38 = sub_100032370();
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      *(void *)(v0 + 1664) = v39;
      *(void *)(v0 + 1672) = (v36 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v39(v35, v37);
      if (v38)
      {
        sub_10000CE90(&qword_100043620);
        uint64_t v40 = sub_100031FF0();
        *(void *)(v0 + 1680) = v40;
        uint64_t v41 = (void *)swift_task_alloc();
        *(void *)(v0 + 1688) = v41;
        void *v41 = v0;
        v41[1] = sub_100028304;
        uint64_t v42 = v0 + 888;
LABEL_25:
        return AVAsynchronousKeyValueLoading.load<A>(_:)(v42, v40);
      }
    }
    v39(*(void *)(v0 + 1296), *(void *)(v0 + 1264));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1352) + 8))(*(void *)(v0 + 1384), *(void *)(v0 + 1344));
  }
  *(void *)(v0 + 1704) = v18;
  int v201 = *(_DWORD *)(v0 + 1788);
  uint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 1488);
  unsigned int v50 = *(void **)(v0 + 1480);
  uint64_t v51 = *(void *)(v0 + 1376);
  uint64_t v52 = *(void *)(v0 + 1344);
  id v53 = objc_allocWithZone((Class)AVAssetReaderTrackOutput);
  id v54 = v50;
  swift_bridgeObjectRetain();
  Class isa = sub_100032810().super.isa;
  swift_bridgeObjectRelease();
  id v56 = [v53 initWithTrack:v54 outputSettings:isa];
  *(void *)(v0 + 1712) = v56;

  sub_100032320();
  if (v49(v51, v52) == v201)
  {
    uint64_t v57 = *(void *)(v0 + 1376);
    uint64_t v58 = *(void *)(v0 + 1280);
    uint64_t v59 = *(void *)(v0 + 1272);
    uint64_t v60 = *(void *)(v0 + 1264);
    (*(void (**)(uint64_t, void))(v0 + 1576))(v57, *(void *)(v0 + 1344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32))(v58, v57, v60);
    [v56 setAppliesPreferredTrackTransform:sub_1000323A0() & 1];
    if (sub_100032360() == 1) {
      [v56 setLimitsImageQueueCapacityToOneFrame:1];
    }
    (*(void (**)(void, void))(*(void *)(v0 + 1272) + 8))(*(void *)(v0 + 1280), *(void *)(v0 + 1264));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1352) + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1344));
    [v56 setAppliesPreferredTrackTransform:1];
  }
  uint64_t v61 = *(void **)(v0 + 1648);
  int v62 = *(_DWORD *)(v0 + 1784);
  uint64_t v63 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v64 = *(void *)(v0 + 1368);
  uint64_t v65 = *(void *)(v0 + 1352);
  uint64_t v66 = *(void *)(v0 + 1344);
  [v56 setAlwaysCopiesSampleData:0];
  [v61 addOutput:v56];
  sub_100032320();
  int v67 = v63(v64, v66);
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  if (v67 == v62)
  {
    sub_10000CE90(&qword_100043610);
    uint64_t v40 = sub_100031FC0();
    *(void *)(v0 + 1720) = v40;
    long long v68 = (void *)swift_task_alloc();
    *(void *)(v0 + 1728) = v68;
    *long long v68 = v0;
    v68[1] = sub_100029920;
    uint64_t v42 = v0 + 1776;
    goto LABEL_25;
  }
  uint64_t v69 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1648) startReading];
  *(void *)(v0 + 1016) = 0;
  id v70 = [v69 copyNextSampleBuffer];
  if (!v70)
  {
    uint64_t v127 = *(void **)(v0 + 1712);
    char v128 = *(void **)(v0 + 1648);
    uint64_t v129 = *(void **)(v0 + 1480);
    uint64_t v130 = *(void **)(v0 + 1456);
    uint64_t v131 = *(void *)(v0 + 1256);
    uint64_t v132 = *(void *)(v0 + 1240);
    uint64_t v133 = *(void *)(v0 + 1232);
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v131, v133);
    goto LABEL_66;
  }
  id v71 = v70;
  uint64_t v72 = *(void *)(v0 + 1584);
  int v73 = *(_DWORD *)(v0 + 1784);
  int v74 = *(_DWORD *)(v0 + 1780);
  uint64_t v75 = (opaqueCMSampleBuffer *)v70;
  uint64_t v171 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v74 != v73 && *(void *)(v0 + 1016) == v72) {
    goto LABEL_65;
  }
  v169 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1240) + 16);
  uint64_t v76 = *(void *)(v0 + 1208);
  uint64_t v77 = *(void *)(v0 + 1168);
  uint64_t v78 = *(void *)(v0 + 1136);
  uint64_t v79 = *(void *)(v0 + 1104);
  v167 = (void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16);
  uint64_t v168 = (void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16);
  uint64_t v170 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1352) + 8);
  int v164 = (void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16);
  __int16 v165 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1080) + 8);
  uint64_t v166 = (void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16);
  uint64_t v160 = (void (**)(uint64_t, uint64_t))(v79 + 8);
  char v161 = (void (**)(uint64_t, uint64_t))(v78 + 8);
  uint64_t v162 = (void (**)(uint64_t, uint64_t))(v77 + 8);
  unint64_t v163 = (void (**)(uint64_t, uint64_t))(v76 + 8);
  uint64_t v80 = v71;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v75)) {
      goto LABEL_44;
    }
    uint64_t v81 = *(void *)(v0 + 1584);
    int v82 = *(_DWORD *)(v0 + 1784);
    int v83 = *(_DWORD *)(v0 + 1780);

    uint64_t v84 = *(void *)(v0 + 1016);
    char v85 = v80;
    char v86 = v85;
    if (v83 != v82 && v84 == v81)
    {
      id v71 = v80;
      uint64_t v75 = v85;
      goto LABEL_65;
    }
    if (!CMSampleBufferGetNumSamples(v85)) {
      break;
    }
    uint64_t v75 = v86;
LABEL_44:
    uint64_t v94 = sub_100032AA0();
    if (!v94)
    {
      uint64_t v141 = *(void **)(v0 + 1712);
      unint64_t v142 = v75;
      uint64_t v143 = *(void **)(v0 + 1648);
      uint64_t v144 = *(void **)(v0 + 1480);
      uint64_t v145 = *(void **)(v0 + 1456);
      uint64_t v146 = *(void *)(v0 + 1240);
      uint64_t v200 = *(void *)(v0 + 1232);
      uint64_t v203 = *(void *)(v0 + 1256);
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v203, v200);
      goto LABEL_66;
    }
    uint64_t v95 = (void *)v94;
    uint64_t v198 = v80;
    uint64_t v202 = v75;
    os_log_type_t v96 = sub_100032A50();
    uint64_t v97 = sub_100032B30();
    if (os_log_type_enabled(v97, v96))
    {
      uint64_t v98 = swift_slowAlloc();
      *(_DWORD *)uint64_t v98 = 134217984;
      *(void *)(v98 + 4) = *v171;
      _os_log_impl((void *)&_mh_execute_header, v97, v96, "BlastDoor processing thumbnail %ld", (uint8_t *)v98, 0xCu);
      swift_slowDealloc();
    }
    int v195 = *(_DWORD *)(v0 + 1784);
    unint64_t v192 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
    uint64_t v188 = *(void *)(v0 + 1360);
    uint64_t v190 = *(void *)(v0 + 1344);
    uint64_t v99 = *(void *)(v0 + 1256);
    uint64_t v100 = *(void *)(v0 + 1248);
    uint64_t v101 = *(void *)(v0 + 1232);
    uint64_t v102 = *(void *)(v0 + 1224);
    uint64_t v174 = *(void *)(v0 + 1216);
    uint64_t v175 = *(void *)(v0 + 1200);
    uint64_t v103 = *(void *)(v0 + 1192);
    uint64_t v104 = *(void *)(v0 + 1184);
    uint64_t v176 = *(void *)(v0 + 1176);
    uint64_t v178 = *(void *)(v0 + 1160);
    uint64_t v173 = *(void *)(v0 + 1152);
    uint64_t v180 = *(void *)(v0 + 1144);
    uint64_t v182 = *(void *)(v0 + 1128);

    sub_100032AB0();
    sub_100032AF0();
    type metadata accessor for CVBuffer(0);
    uint64_t v105 = sub_100032740();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v103, 1, 1, v105);
    id v106 = v95;
    sub_100032750();
    uint64_t v107 = *v169;
    (*v169)(v100, v99, v101);
    sub_1000322E0();
    v107(v100, v99, v101);
    sub_100032300();
    (*v168)(v174, v102, v175);
    (*v167)(v176, v104, v178);
    (*v166)(v180, v173, v182);
    sub_1000323E0();
    sub_100032320();
    int v108 = v192(v188, v190);
    uint64_t v109 = *(void **)(v0 + 1712);
    v172 = v106;
    if (v108 == v195)
    {
      unint64_t v179 = *(void **)(v0 + 1648);
      v181 = *(void **)(v0 + 1480);
      uint64_t v183 = *(void **)(v0 + 1456);
      uint64_t v147 = *(void *)(v0 + 1360);
      uint64_t v148 = *(void *)(v0 + 1344);
      uint64_t v194 = *(void *)(v0 + 1232);
      uint64_t v197 = *(void *)(v0 + 1256);
      uint64_t v191 = *(void *)(v0 + 1224);
      uint64_t v193 = *(void *)(v0 + 1240);
      uint64_t v187 = *(void *)(v0 + 1184);
      uint64_t v189 = *(void *)(v0 + 1200);
      uint64_t v186 = *(void *)(v0 + 1160);
      uint64_t v184 = *(void *)(v0 + 1128);
      uint64_t v185 = *(void *)(v0 + 1152);
      uint64_t v149 = *(void *)(v0 + 1120);
      uint64_t v150 = *(void *)(v0 + 1112);
      uint64_t v151 = *(void *)(v0 + 1096);
      uint64_t v152 = *(void *)(v0 + 1088);
      uint64_t v177 = *(void *)(v0 + 1072);
      swift_bridgeObjectRelease();
      (*v170)(v147, v148);
      (*v164)(v150, v149, v151);
      sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_100032560();
      sub_10000CE90(&qword_1000435A0);
      sub_1000329C0();
      (*v165)(v152, v177);
      *(void *)(v0 + 968) = 0;
      sub_1000329D0();

      (*v160)(v149, v151);
      (*v161)(v185, v184);
      (*v162)(v187, v186);
      (*v163)(v191, v189);
      (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v197, v194);
      goto LABEL_66;
    }
    (*v170)(*(void *)(v0 + 1360), *(void *)(v0 + 1344));
    id v71 = [v109 copyNextSampleBuffer];

    uint64_t v110 = *(void *)(v0 + 1016);
    BOOL v111 = __OFADD__(v110, 1);
    uint64_t v112 = v110 + 1;
    if (v111) {
      goto LABEL_79;
    }
    *uint64_t v171 = v112;
    if (v71) {
      BOOL v114 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v112 == *(void *)(v0 + 1584);
    }
    else {
      BOOL v114 = 1;
    }
    uint64_t v115 = *(void *)(v0 + 1088);
    uint64_t v116 = *(void *)(v0 + 1072);
    (*v164)(*(void *)(v0 + 1112), *(void *)(v0 + 1120), *(void *)(v0 + 1096));
    sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_100032560();
    sub_10000CE90(&qword_1000435A0);
    sub_1000329C0();
    (*v165)(v115, v116);
    uint64_t v117 = *(void *)(v0 + 1224);
    uint64_t v196 = *(void *)(v0 + 1184);
    uint64_t v199 = *(void *)(v0 + 1200);
    uint64_t v118 = *(void *)(v0 + 1160);
    uint64_t v119 = *(void *)(v0 + 1152);
    uint64_t v120 = *(void *)(v0 + 1128);
    uint64_t v121 = *(void *)(v0 + 1120);
    uint64_t v122 = *(void *)(v0 + 1096);
    if (v114)
    {
      *(void *)(v0 + 976) = 0;
      sub_1000329D0();
    }

    (*v160)(v121, v122);
    (*v161)(v119, v120);
    (*v162)(v196, v118);
    (*v163)(v117, v199);
    if (!v71)
    {
      uint64_t v153 = *(void **)(v0 + 1712);
      char v154 = *(void **)(v0 + 1480);
      uint64_t v155 = *(void **)(v0 + 1456);
      uint64_t v156 = *(void *)(v0 + 1256);
      uint64_t v157 = *(void *)(v0 + 1240);
      uint64_t v158 = *(void *)(v0 + 1232);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v156, v158);
      goto LABEL_66;
    }
    uint64_t v123 = *(void *)(v0 + 1584);
    int v124 = *(_DWORD *)(v0 + 1784);
    int v125 = *(_DWORD *)(v0 + 1780);
    uint64_t v126 = *(void *)(v0 + 1016);
    uint64_t v75 = (opaqueCMSampleBuffer *)v71;
    uint64_t v80 = v71;
    if (v125 != v124)
    {
      uint64_t v80 = v71;
      if (v126 == v123) {
        goto LABEL_65;
      }
    }
  }
  while (1)
  {
    uint64_t v88 = *(void *)(v0 + 1584);
    int v89 = *(_DWORD *)(v0 + 1784);
    int v90 = *(_DWORD *)(v0 + 1780);

    uint64_t v91 = *(void *)(v0 + 1016);
    uint64_t v92 = v86;
    uint64_t v75 = v92;
    if (v90 != v89 && v91 == v88) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v92)) {
      goto LABEL_44;
    }
  }
  id v71 = v80;
LABEL_65:
  uint64_t v134 = *(void **)(v0 + 1712);
  unint64_t v135 = *(void **)(v0 + 1480);
  uint64_t v136 = *(void **)(v0 + 1456);
  uint64_t v137 = *(void *)(v0 + 1256);
  uint64_t v138 = *(void *)(v0 + 1240);
  uint64_t v139 = *(void *)(v0 + 1232);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v137, v139);
LABEL_66:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v140 = *(uint64_t (**)(void))(v0 + 8);
  return v140();
}

uint64_t sub_100028304()
{
  *(void *)(*(void *)v1 + 1696) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v2 = sub_10002BAFC;
  }
  else
  {
    swift_release();
    id v2 = sub_100028480;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100028480()
{
  uint64_t v188 = v0;
  uint64_t v1 = *(void *)(v0 + 904);
  uint64_t v2 = *(void *)(v0 + 896);
  *(void *)(v0 + 912) = *(void *)(v0 + 888);
  *(void *)(v0 + 920) = v2;
  *(void *)(v0 + 928) = v1;
  double Seconds = CMTimeGetSeconds((CMTime *)(v0 + 912));
  uint64_t v4 = sub_100032350();
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
LABEL_62:
    __break(1u);
  }
  double v5 = Seconds / ((double)(v4 - 1) + 0.1);
  if (v5 <= 0.0)
  {
    (*(void (**)(void, void))(v0 + 1664))(*(void *)(v0 + 1296), *(void *)(v0 + 1264));
    CMTimeValue value = *(void *)(v0 + 1656);
  }
  else
  {
    CMTimeMakeWithSeconds(&v185, v5, 1000);
    CMTimeEpoch epoch = v185.epoch;
    uint64_t v7 = *(void *)&v185.timescale;
    *(void *)(v0 + 864) = v185.value;
    *(void *)(v0 + 872) = v7;
    *(void *)(v0 + 880) = epoch;
    CFDictionaryRef v8 = CMTimeCopyAsDictionary((CMTime *)(v0 + 864), kCFAllocatorDefault);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1664);
    CMTimeValue v10 = *(void *)(v0 + 1656);
    if (!v8)
    {
      uint64_t v100 = *(void **)(v0 + 1648);
      uint64_t v101 = *(void **)(v0 + 1480);
      uint64_t v102 = *(void **)(v0 + 1456);
      uint64_t v103 = *(void *)(v0 + 1296);
      uint64_t v104 = *(void *)(v0 + 1264);
      uint64_t v105 = *(void *)(v0 + 1240);
      uint64_t v177 = *(void *)(v0 + 1232);
      uint64_t v181 = *(void *)(v0 + 1256);
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      v9(v103, v104);
      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v181, v177);
      goto LABEL_54;
    }
    CFDictionaryRef v11 = v8;
    uint64_t v12 = *(void *)(v0 + 1296);
    uint64_t v13 = *(void *)(v0 + 1264);
    uint64_t v14 = sub_100032870();
    uint64_t v16 = v15;
    *(void *)(v0 + 720) = sub_100023A7C(0, &qword_100043628);
    *(void *)(v0 + 696) = v11;
    sub_100023A54((_OWORD *)(v0 + 696), (_OWORD *)(v0 + 664));
    CFDictionaryRef v17 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v185.CMTimeValue value = v10;
    sub_10002E184((_OWORD *)(v0 + 664), v14, v16, isUniquelyReferenced_nonNull_native);
    CMTimeValue value = v185.value;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v9(v12, v13);
  }
  *(void *)(v0 + 1704) = value;
  int v182 = *(_DWORD *)(v0 + 1788);
  int v20 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v21 = *(void **)(v0 + 1480);
  uint64_t v22 = *(void *)(v0 + 1376);
  uint64_t v23 = *(void *)(v0 + 1344);
  id v24 = objc_allocWithZone((Class)AVAssetReaderTrackOutput);
  id v25 = v21;
  swift_bridgeObjectRetain();
  Class isa = sub_100032810().super.isa;
  swift_bridgeObjectRelease();
  id v27 = [v24 initWithTrack:v25 outputSettings:isa];
  *(void *)(v0 + 1712) = v27;

  sub_100032320();
  if (v20(v22, v23) == v182)
  {
    uint64_t v28 = *(void *)(v0 + 1376);
    uint64_t v29 = *(void *)(v0 + 1280);
    uint64_t v30 = *(void *)(v0 + 1272);
    uint64_t v31 = *(void *)(v0 + 1264);
    (*(void (**)(uint64_t, void))(v0 + 1576))(v28, *(void *)(v0 + 1344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v29, v28, v31);
    [v27 setAppliesPreferredTrackTransform:sub_1000323A0() & 1];
    if (sub_100032360() == 1) {
      [v27 setLimitsImageQueueCapacityToOneFrame:1];
    }
    (*(void (**)(void, void))(*(void *)(v0 + 1272) + 8))(*(void *)(v0 + 1280), *(void *)(v0 + 1264));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1352) + 8))(*(void *)(v0 + 1376), *(void *)(v0 + 1344));
    [v27 setAppliesPreferredTrackTransform:1];
  }
  uint64_t v32 = *(void **)(v0 + 1648);
  int v33 = *(_DWORD *)(v0 + 1784);
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
  uint64_t v35 = *(void *)(v0 + 1368);
  uint64_t v36 = *(void *)(v0 + 1352);
  uint64_t v37 = *(void *)(v0 + 1344);
  [v27 setAlwaysCopiesSampleData:0];
  [v32 addOutput:v27];
  sub_100032320();
  int v38 = v34(v35, v37);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  if (v38 == v33)
  {
    sub_10000CE90(&qword_100043610);
    uint64_t v39 = sub_100031FC0();
    *(void *)(v0 + 1720) = v39;
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 1728) = v40;
    *uint64_t v40 = v0;
    v40[1] = sub_100029920;
    return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 1776, v39);
  }
  uint64_t v41 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1648) startReading];
  *(void *)(v0 + 1016) = 0;
  id v42 = [v41 copyNextSampleBuffer];
  if (!v42)
  {
    id v106 = *(void **)(v0 + 1712);
    uint64_t v107 = *(void **)(v0 + 1648);
    int v108 = *(void **)(v0 + 1480);
    uint64_t v109 = *(void **)(v0 + 1456);
    uint64_t v110 = *(void *)(v0 + 1256);
    uint64_t v111 = *(void *)(v0 + 1240);
    uint64_t v112 = *(void *)(v0 + 1232);
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v110, v112);
    goto LABEL_54;
  }
  id v43 = v42;
  uint64_t v44 = *(void *)(v0 + 1584);
  int v45 = *(_DWORD *)(v0 + 1784);
  int v46 = *(_DWORD *)(v0 + 1780);
  uint64_t v47 = (opaqueCMSampleBuffer *)v42;
  uint64_t v151 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v46 != v45 && *(void *)(v0 + 1016) == v44) {
    goto LABEL_53;
  }
  uint64_t v48 = *(void *)(v0 + 1208);
  uint64_t v149 = (void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  uint64_t v150 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1240) + 16);
  uint64_t v49 = *(void *)(v0 + 1168);
  uint64_t v50 = *(void *)(v0 + 1136);
  uint64_t v51 = *(void *)(v0 + 1104);
  uint64_t v147 = (void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  uint64_t v148 = (void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  uint64_t v146 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1352) + 8);
  uint64_t v140 = (void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  uint64_t v141 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1080) + 8);
  unint64_t v142 = (void (**)(uint64_t, uint64_t))(v51 + 8);
  uint64_t v143 = (void (**)(uint64_t, uint64_t))(v50 + 8);
  uint64_t v144 = (void (**)(uint64_t, uint64_t))(v49 + 8);
  uint64_t v145 = (void (**)(uint64_t, uint64_t))(v48 + 8);
  uint64_t v52 = v43;
  while (1)
  {
    unint64_t v179 = v52;
    if (CMSampleBufferGetNumSamples(v47)) {
      goto LABEL_31;
    }
    uint64_t v53 = *(void *)(v0 + 1584);
    int v54 = *(_DWORD *)(v0 + 1784);
    int v55 = *(_DWORD *)(v0 + 1780);

    uint64_t v56 = *(void *)(v0 + 1016);
    uint64_t v57 = v52;
    uint64_t v58 = v57;
    if (v55 != v54 && v56 == v53)
    {
      id v43 = v52;
      uint64_t v47 = v57;
      goto LABEL_53;
    }
    if (!CMSampleBufferGetNumSamples(v57)) {
      break;
    }
    uint64_t v47 = v58;
LABEL_31:
    uint64_t v66 = sub_100032AA0();
    if (!v66)
    {
      uint64_t v120 = *(void **)(v0 + 1712);
      uint64_t v121 = v47;
      uint64_t v122 = *(void **)(v0 + 1648);
      uint64_t v123 = *(void **)(v0 + 1480);
      int v124 = *(void **)(v0 + 1456);
      uint64_t v184 = *(void *)(v0 + 1256);
      uint64_t v125 = *(void *)(v0 + 1240);
      uint64_t v126 = *(void *)(v0 + 1232);
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v184, v126);
      goto LABEL_54;
    }
    int v67 = (void *)v66;
    uint64_t v183 = v47;
    os_log_type_t v68 = sub_100032A50();
    uint64_t v69 = sub_100032B30();
    if (os_log_type_enabled(v69, v68))
    {
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 134217984;
      *(void *)(v70 + 4) = *v151;
      _os_log_impl((void *)&_mh_execute_header, v69, v68, "BlastDoor processing thumbnail %ld", (uint8_t *)v70, 0xCu);
      swift_slowDealloc();
    }
    int v175 = *(_DWORD *)(v0 + 1784);
    v172 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
    uint64_t v168 = *(void *)(v0 + 1360);
    uint64_t v170 = *(void *)(v0 + 1344);
    uint64_t v71 = *(void *)(v0 + 1256);
    uint64_t v72 = *(void *)(v0 + 1248);
    uint64_t v73 = *(void *)(v0 + 1232);
    uint64_t v74 = *(void *)(v0 + 1224);
    uint64_t v154 = *(void *)(v0 + 1216);
    uint64_t v155 = *(void *)(v0 + 1200);
    uint64_t v75 = *(void *)(v0 + 1192);
    uint64_t v76 = *(void *)(v0 + 1184);
    uint64_t v156 = *(void *)(v0 + 1176);
    uint64_t v158 = *(void *)(v0 + 1160);
    uint64_t v153 = *(void *)(v0 + 1152);
    uint64_t v160 = *(void *)(v0 + 1144);
    uint64_t v162 = *(void *)(v0 + 1128);

    sub_100032AB0();
    sub_100032AF0();
    type metadata accessor for CVBuffer(0);
    uint64_t v186 = v77;
    uint64_t v187 = &protocol witness table for CVBufferRef;
    v185.CMTimeValue value = (CMTimeValue)v67;
    uint64_t v78 = sub_100032740();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v75, 1, 1, v78);
    id v79 = v67;
    sub_100032750();
    uint64_t v80 = *v150;
    (*v150)(v72, v71, v73);
    sub_1000322E0();
    v80(v72, v71, v73);
    sub_100032300();
    (*v149)(v154, v74, v155);
    (*v148)(v156, v76, v158);
    (*v147)(v160, v153, v162);
    sub_1000323E0();
    sub_100032320();
    int v81 = v172(v168, v170);
    int v82 = *(void **)(v0 + 1712);
    uint64_t v152 = v79;
    if (v81 == v175)
    {
      char v159 = *(void **)(v0 + 1648);
      char v161 = *(void **)(v0 + 1480);
      unint64_t v163 = *(void **)(v0 + 1456);
      uint64_t v127 = *(void *)(v0 + 1360);
      uint64_t v128 = *(void *)(v0 + 1344);
      uint64_t v174 = *(void *)(v0 + 1232);
      uint64_t v178 = *(void *)(v0 + 1256);
      uint64_t v171 = *(void *)(v0 + 1224);
      uint64_t v173 = *(void *)(v0 + 1240);
      uint64_t v167 = *(void *)(v0 + 1184);
      uint64_t v169 = *(void *)(v0 + 1200);
      uint64_t v166 = *(void *)(v0 + 1160);
      uint64_t v164 = *(void *)(v0 + 1128);
      uint64_t v165 = *(void *)(v0 + 1152);
      uint64_t v129 = *(void *)(v0 + 1120);
      uint64_t v130 = *(void *)(v0 + 1112);
      uint64_t v131 = *(void *)(v0 + 1096);
      uint64_t v132 = *(void *)(v0 + 1088);
      uint64_t v157 = *(void *)(v0 + 1072);
      swift_bridgeObjectRelease();
      (*v146)(v127, v128);
      (*v140)(v130, v129, v131);
      sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_100032560();
      sub_10000CE90(&qword_1000435A0);
      sub_1000329C0();
      (*v141)(v132, v157);
      *(void *)(v0 + 968) = 0;
      sub_1000329D0();

      (*v142)(v129, v131);
      (*v143)(v165, v164);
      (*v144)(v167, v166);
      (*v145)(v171, v169);
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v178, v174);
      goto LABEL_54;
    }
    (*v146)(*(void *)(v0 + 1360), *(void *)(v0 + 1344));
    id v43 = [v82 copyNextSampleBuffer];

    uint64_t v83 = *(void *)(v0 + 1016);
    BOOL v84 = __OFADD__(v83, 1);
    uint64_t v85 = v83 + 1;
    if (v84) {
      goto LABEL_62;
    }
    *uint64_t v151 = v85;
    if (v43) {
      BOOL v87 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v85 == *(void *)(v0 + 1584);
    }
    else {
      BOOL v87 = 1;
    }
    uint64_t v88 = *(void *)(v0 + 1088);
    uint64_t v89 = *(void *)(v0 + 1072);
    (*v140)(*(void *)(v0 + 1112), *(void *)(v0 + 1120), *(void *)(v0 + 1096));
    sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_100032560();
    sub_10000CE90(&qword_1000435A0);
    sub_1000329C0();
    (*v141)(v88, v89);
    uint64_t v90 = *(void *)(v0 + 1224);
    uint64_t v176 = *(void *)(v0 + 1184);
    uint64_t v180 = *(void *)(v0 + 1200);
    uint64_t v91 = *(void *)(v0 + 1160);
    uint64_t v92 = *(void *)(v0 + 1152);
    uint64_t v93 = *(void *)(v0 + 1128);
    uint64_t v94 = *(void *)(v0 + 1120);
    uint64_t v95 = *(void *)(v0 + 1096);
    if (v87)
    {
      *(void *)(v0 + 976) = 0;
      sub_1000329D0();
    }

    (*v142)(v94, v95);
    (*v143)(v92, v93);
    (*v144)(v176, v91);
    (*v145)(v90, v180);
    if (!v43)
    {
      uint64_t v133 = *(void **)(v0 + 1712);
      uint64_t v134 = *(void **)(v0 + 1480);
      unint64_t v135 = *(void **)(v0 + 1456);
      uint64_t v136 = *(void *)(v0 + 1256);
      uint64_t v137 = *(void *)(v0 + 1240);
      uint64_t v138 = *(void *)(v0 + 1232);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v136, v138);
      goto LABEL_54;
    }
    uint64_t v96 = *(void *)(v0 + 1584);
    int v97 = *(_DWORD *)(v0 + 1784);
    int v98 = *(_DWORD *)(v0 + 1780);
    uint64_t v99 = *(void *)(v0 + 1016);
    uint64_t v47 = (opaqueCMSampleBuffer *)v43;
    uint64_t v52 = v43;
    if (v98 != v97)
    {
      uint64_t v52 = v43;
      if (v99 == v96) {
        goto LABEL_53;
      }
    }
  }
  while (1)
  {
    uint64_t v60 = *(void *)(v0 + 1584);
    int v61 = *(_DWORD *)(v0 + 1784);
    int v62 = *(_DWORD *)(v0 + 1780);

    uint64_t v63 = *(void *)(v0 + 1016);
    uint64_t v64 = v58;
    uint64_t v47 = v64;
    if (v62 != v61 && v63 == v60) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v64)) {
      goto LABEL_31;
    }
  }
  id v43 = v52;
LABEL_53:
  uint64_t v113 = *(void **)(v0 + 1712);
  BOOL v114 = *(void **)(v0 + 1480);
  uint64_t v115 = *(void **)(v0 + 1456);
  uint64_t v116 = *(void *)(v0 + 1256);
  uint64_t v117 = *(void *)(v0 + 1240);
  uint64_t v118 = *(void *)(v0 + 1232);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v116, v118);
LABEL_54:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v119 = *(uint64_t (**)(void))(v0 + 8);
  return v119();
}

uint64_t sub_100029920()
{
  *(void *)(*(void *)v1 + 1736) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v2 = sub_10002BD5C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100029A9C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100029A9C()
{
  float v1 = ceilf(*(float *)(v0 + 1776));
  *(float *)(v0 + 1792) = v1;
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 <= -2147500000.0)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (v1 >= 2147500000.0) {
    goto LABEL_9;
  }
  *(void *)(v0 + 1744) = kCMTimeZero.value;
  *(void *)(v0 + 1796) = *(void *)&kCMTimeZero.timescale;
  *(void *)(v0 + 1752) = kCMTimeZero.epoch;
  sub_10000CE90(&qword_100043618);
  uint64_t v2 = sub_100031FE0();
  *(void *)(v0 + 1760) = v2;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1768) = v3;
  *id v3 = v0;
  v3[1] = sub_100029BF8;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 1008, v2);
}

uint64_t sub_100029BF8()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    swift_release();
    float v1 = sub_10002BFA8;
  }
  else
  {
    swift_release();
    float v1 = sub_100029D6C;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_100029D6C()
{
  uint64_t v184 = v0;
  id v1 = *(id *)(v0 + 1008);
  if ((unint64_t)v1 >> 62) {
    goto LABEL_71;
  }
  uint64_t v2 = *(void *)(((unint64_t)v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = (uint64_t *)(v0 + 1796);
    if (!v2) {
      break;
    }
    unint64_t v4 = 0;
    unint64_t v5 = (unint64_t)v1 & 0xC000000000000001;
    uint64_t v6 = &selRef_decrementUnderlineCount;
    uint64_t v163 = v2;
    while (1)
    {
      if (v5)
      {
        id v7 = (id)sub_100032BD0();
      }
      else
      {
        if (v4 >= *(void *)(((unint64_t)v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_69;
        }
        id v7 = *((id *)v1 + v4 + 4);
      }
      CFDictionaryRef v8 = v7;
      BOOL v9 = __OFADD__(v4++, 1);
      if (v9) {
        break;
      }
      if (([v7 v6[128]] & 1) == 0)
      {
        CMTimeValue v10 = *(void **)(v0 + 1480);
        [v8 timeMapping];
        uint64_t v11 = v176;
        uint64_t v12 = v175;
        *(void *)(v0 + 792) = v174;
        *(void *)(v0 + 800) = v12;
        *(void *)(v0 + 808) = v11;
        id v13 = [v10 makeSampleCursorWithPresentationTimeStamp:v0 + 792];
        if (v13)
        {
          uint64_t v14 = v13;
          do
          {
            if (([v14 currentSampleDependencyInfo] & 0x1000000) == 0) {
              break;
            }
            if ([v14 stepInPresentationOrderByCount:1] != (id)1) {
              break;
            }
            [v14 presentationTimeStamp];
            [v8 timeMapping];
            uint64_t v15 = v178;
            uint64_t v16 = v175;
            CFDictionaryRef v17 = v177;
            long long v18 = v176;
            *(void *)(v0 + 480) = v174;
            *(void *)(v0 + 488) = v16;
            *(_OWORD *)(v0 + 496) = v18;
            *(void *)(v0 + 512) = v17;
            *(void *)(v0 + 520) = v15;
            sub_100032A20();
          }
          while ((sub_100032AD0() & 1) == 0);
          if (([v14 currentSampleDependencyInfo] & 0x1000000) == 0)
          {
            swift_bridgeObjectRelease();
            [v14 presentationTimeStamp];
            uint64_t v91 = v174;
            uint64_t v92 = v176;
            uint64_t v93 = v175;
            [v8 timeMapping];
            uint64_t v94 = v174;
            long long v95 = v176;
            uint64_t v96 = v178;
            uint64_t v97 = v175;
            int v98 = v177;
            [v8 timeMapping];
            uint64_t v99 = v179;
            uint64_t v100 = v183;
            uint64_t v101 = v180;
            uint64_t v102 = v182;
            long long v103 = v181;
            *(void *)(v0 + 816) = v91;
            *(void *)(v0 + 824) = v93;
            *(void *)(v0 + 832) = v92;
            *(void *)(v0 + 336) = v94;
            *(void *)(v0 + 344) = v97;
            *(_OWORD *)(v0 + 352) = v95;
            *(void *)(v0 + 368) = v98;
            *(void *)(v0 + 376) = v96;
            *(void *)(v0 + 576) = v99;
            *(void *)(v0 + 584) = v101;
            *(_OWORD *)(v0 + 592) = v103;
            *(void *)(v0 + 608) = v102;
            *(void *)(v0 + 616) = v100;
            CMTimeMapTimeFromRangeToRange((CMTime *)&v174, (CMTime *)(v0 + 816), (CMTimeRange *)(v0 + 336), (CMTimeRange *)(v0 + 576));
            uint64_t v21 = v174;
            uint64_t v20 = v175;
            uint64_t v19 = v176;

            goto LABEL_22;
          }

          unint64_t v5 = (unint64_t)v1 & 0xC000000000000001;
          uint64_t v2 = v163;
          uint64_t v6 = &selRef_decrementUnderlineCount;
        }
      }

      if (v4 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v0 + 1752);
        uint64_t v3 = (uint64_t *)(v0 + 1796);
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100032C10();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v0 + 1752);
LABEL_21:
  uint64_t v20 = *v3;
  uint64_t v21 = *(void **)(v0 + 1744);
LABEL_22:
  uint64_t v22 = *(void **)(v0 + 1648);
  unint64_t v23 = sub_100032AE0(1, (int)*(float *)(v0 + 1792));
  *(void *)(v0 + 384) = v21;
  *(void *)(v0 + 392) = v20;
  *(void *)(v0 + 400) = v19;
  *(void *)(v0 + 408) = v23;
  *(_DWORD *)(v0 + 416) = v24;
  *(_DWORD *)(v0 + 420) = v25;
  *(void *)(v0 + 424) = v26;
  [v22 setTimeRange:v0 + 384];
  id v27 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1648) startReading];
  *(void *)(v0 + 1016) = 0;
  id v28 = [v27 copyNextSampleBuffer];
  if (!v28)
  {
    BOOL v84 = *(void **)(v0 + 1712);
    uint64_t v85 = *(void **)(v0 + 1648);
    char v86 = *(void **)(v0 + 1480);
    BOOL v87 = *(void **)(v0 + 1456);
    uint64_t v88 = *(void *)(v0 + 1256);
    uint64_t v89 = *(void *)(v0 + 1240);
    uint64_t v90 = *(void *)(v0 + 1232);
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v88, v90);
    goto LABEL_61;
  }
  id v1 = v28;
  uint64_t v29 = *(void *)(v0 + 1584);
  int v30 = *(_DWORD *)(v0 + 1784);
  int v31 = *(_DWORD *)(v0 + 1780);
  uint64_t v32 = (opaqueCMSampleBuffer *)v28;
  uint64_t v141 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v31 != v30 && *(void *)(v0 + 1016) == v29) {
    goto LABEL_60;
  }
  uint64_t v139 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1240) + 16);
  uint64_t v33 = *(void *)(v0 + 1208);
  uint64_t v34 = *(void *)(v0 + 1168);
  uint64_t v35 = *(void *)(v0 + 1136);
  uint64_t v36 = *(void *)(v0 + 1104);
  uint64_t v137 = (void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  uint64_t v138 = (void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
  uint64_t v140 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1352) + 8);
  uint64_t v130 = (void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
  uint64_t v131 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1080) + 8);
  uint64_t v132 = (void (**)(uint64_t, uint64_t))(v36 + 8);
  uint64_t v133 = (void (**)(uint64_t, uint64_t))(v35 + 8);
  uint64_t v134 = (void (**)(CMTimeRange *, uint64_t))(v34 + 8);
  unint64_t v135 = (void (**)(uint64_t, uint64_t))(v33 + 8);
  uint64_t v136 = (void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  uint64_t v37 = v1;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v32)) {
      goto LABEL_38;
    }
    uint64_t v38 = *(void *)(v0 + 1584);
    int v39 = *(_DWORD *)(v0 + 1784);
    int v40 = *(_DWORD *)(v0 + 1780);

    uint64_t v41 = *(void *)(v0 + 1016);
    id v42 = v37;
    id v43 = v42;
    if (v40 != v39 && v41 == v38)
    {
      id v1 = v37;
      uint64_t v32 = v42;
      goto LABEL_60;
    }
    if (!CMSampleBufferGetNumSamples(v42)) {
      break;
    }
    uint64_t v32 = v43;
LABEL_38:
    uint64_t v51 = sub_100032AA0();
    if (!v51)
    {
      uint64_t v112 = *(void **)(v0 + 1712);
      uint64_t v113 = v32;
      BOOL v114 = *(void **)(v0 + 1648);
      uint64_t v115 = *(void **)(v0 + 1480);
      uint64_t v116 = *(void **)(v0 + 1456);
      uint64_t v117 = *(void *)(v0 + 1240);
      uint64_t v170 = *(void *)(v0 + 1232);
      uint64_t v173 = *(void *)(v0 + 1256);
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v173, v170);
      goto LABEL_61;
    }
    uint64_t v52 = (void *)v51;
    uint64_t v143 = v37;
    v172 = v32;
    os_log_type_t v53 = sub_100032A50();
    int v54 = sub_100032B30();
    if (os_log_type_enabled(v54, v53))
    {
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 134217984;
      *(void *)(v55 + 4) = *v141;
      _os_log_impl((void *)&_mh_execute_header, v54, v53, "BlastDoor processing thumbnail %ld", (uint8_t *)v55, 0xCu);
      swift_slowDealloc();
    }
    int v168 = *(_DWORD *)(v0 + 1784);
    uint64_t v164 = *(uint64_t (**)(CMTimeRange *, uint64_t))(v0 + 1488);
    fromRange = *(CMTimeRange **)(v0 + 1360);
    uint64_t v161 = *(void *)(v0 + 1344);
    uint64_t v56 = *(void *)(v0 + 1256);
    uint64_t v57 = *(void *)(v0 + 1248);
    uint64_t v58 = *(void *)(v0 + 1232);
    uint64_t v59 = *(void *)(v0 + 1224);
    uint64_t v145 = *(void *)(v0 + 1216);
    uint64_t v146 = *(void *)(v0 + 1200);
    uint64_t v60 = *(void *)(v0 + 1192);
    uint64_t v61 = *(void *)(v0 + 1184);
    uint64_t v147 = *(void *)(v0 + 1176);
    uint64_t v148 = *(void *)(v0 + 1160);
    uint64_t v144 = *(void *)(v0 + 1152);
    uint64_t v150 = *(void *)(v0 + 1144);
    uint64_t v152 = *(void *)(v0 + 1128);

    sub_100032AB0();
    sub_100032AF0();
    type metadata accessor for CVBuffer(0);
    *((void *)&v176 + 1) = v62;
    uint64_t v177 = &protocol witness table for CVBufferRef;
    uint64_t v174 = v52;
    uint64_t v63 = sub_100032740();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v60, 1, 1, v63);
    id v64 = v52;
    sub_100032750();
    uint64_t v65 = *v139;
    (*v139)(v57, v56, v58);
    sub_1000322E0();
    v65(v57, v56, v58);
    sub_100032300();
    (*v138)(v145, v59, v146);
    (*v137)(v147, v61, v148);
    (*v136)(v150, v144, v152);
    sub_1000323E0();
    sub_100032320();
    int v66 = v164(fromRange, v161);
    int v67 = *(void **)(v0 + 1712);
    unint64_t v142 = v64;
    if (v66 == v168)
    {
      uint64_t v151 = *(void **)(v0 + 1648);
      uint64_t v153 = *(void **)(v0 + 1480);
      uint64_t v154 = *(void **)(v0 + 1456);
      uint64_t v118 = *(void *)(v0 + 1360);
      uint64_t v119 = *(void *)(v0 + 1344);
      uint64_t v167 = *(void *)(v0 + 1232);
      uint64_t v171 = *(void *)(v0 + 1256);
      uint64_t v162 = *(void *)(v0 + 1224);
      uint64_t v165 = *(void *)(v0 + 1240);
      fromRangea = *(CMTimeRange **)(v0 + 1184);
      uint64_t v160 = *(void *)(v0 + 1200);
      uint64_t v156 = *(void *)(v0 + 1152);
      uint64_t v157 = *(void *)(v0 + 1160);
      uint64_t v155 = *(void *)(v0 + 1128);
      uint64_t v120 = *(void *)(v0 + 1120);
      uint64_t v121 = *(void *)(v0 + 1112);
      uint64_t v122 = *(void *)(v0 + 1096);
      uint64_t v123 = *(void *)(v0 + 1088);
      uint64_t v149 = *(void *)(v0 + 1072);
      swift_bridgeObjectRelease();
      (*v140)(v118, v119);
      (*v130)(v121, v120, v122);
      sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_100032560();
      sub_10000CE90(&qword_1000435A0);
      sub_1000329C0();
      (*v131)(v123, v149);
      *(void *)(v0 + 968) = 0;
      sub_1000329D0();

      (*v132)(v120, v122);
      (*v133)(v156, v155);
      (*v134)(fromRangea, v157);
      (*v135)(v162, v160);
      (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v171, v167);
      goto LABEL_61;
    }
    (*v140)(*(void *)(v0 + 1360), *(void *)(v0 + 1344));
    id v1 = [v67 copyNextSampleBuffer];

    uint64_t v68 = *(void *)(v0 + 1016);
    BOOL v9 = __OFADD__(v68, 1);
    uint64_t v69 = v68 + 1;
    if (v9) {
      goto LABEL_70;
    }
    *uint64_t v141 = v69;
    if (v1) {
      BOOL v71 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v69 == *(void *)(v0 + 1584);
    }
    else {
      BOOL v71 = 1;
    }
    uint64_t v72 = *(void *)(v0 + 1088);
    uint64_t v73 = *(void *)(v0 + 1072);
    (*v130)(*(void *)(v0 + 1112), *(void *)(v0 + 1120), *(void *)(v0 + 1096));
    sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_100032560();
    sub_10000CE90(&qword_1000435A0);
    sub_1000329C0();
    (*v131)(v72, v73);
    uint64_t v74 = *(void *)(v0 + 1224);
    uint64_t v166 = *(CMTimeRange **)(v0 + 1184);
    uint64_t v169 = *(void *)(v0 + 1200);
    uint64_t v75 = *(void *)(v0 + 1160);
    uint64_t v76 = *(void *)(v0 + 1152);
    uint64_t v77 = *(void *)(v0 + 1128);
    uint64_t v78 = *(void *)(v0 + 1120);
    uint64_t v79 = *(void *)(v0 + 1096);
    if (v71)
    {
      *(void *)(v0 + 976) = 0;
      sub_1000329D0();
    }

    (*v132)(v78, v79);
    (*v133)(v76, v77);
    (*v134)(v166, v75);
    (*v135)(v74, v169);
    if (!v1)
    {
      int v124 = *(void **)(v0 + 1712);
      uint64_t v125 = *(void **)(v0 + 1480);
      uint64_t v126 = *(void **)(v0 + 1456);
      uint64_t v127 = *(void *)(v0 + 1256);
      uint64_t v128 = *(void *)(v0 + 1240);
      uint64_t v129 = *(void *)(v0 + 1232);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v129);
      goto LABEL_61;
    }
    uint64_t v80 = *(void *)(v0 + 1584);
    int v81 = *(_DWORD *)(v0 + 1784);
    int v82 = *(_DWORD *)(v0 + 1780);
    uint64_t v83 = *(void *)(v0 + 1016);
    uint64_t v32 = (opaqueCMSampleBuffer *)v1;
    uint64_t v37 = v1;
    if (v82 != v81)
    {
      uint64_t v37 = v1;
      if (v83 == v80) {
        goto LABEL_60;
      }
    }
  }
  while (1)
  {
    uint64_t v45 = *(void *)(v0 + 1584);
    int v46 = *(_DWORD *)(v0 + 1784);
    int v47 = *(_DWORD *)(v0 + 1780);

    uint64_t v48 = *(void *)(v0 + 1016);
    uint64_t v49 = v43;
    uint64_t v32 = v49;
    if (v47 != v46 && v48 == v45) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v49)) {
      goto LABEL_38;
    }
  }
  id v1 = v37;
LABEL_60:
  uint64_t v104 = *(void **)(v0 + 1712);
  uint64_t v105 = *(void **)(v0 + 1480);
  id v106 = *(void **)(v0 + 1456);
  uint64_t v107 = *(void *)(v0 + 1256);
  uint64_t v108 = *(void *)(v0 + 1240);
  uint64_t v109 = *(void *)(v0 + 1232);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v109);
LABEL_61:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v110 = *(uint64_t (**)(void))(v0 + 8);
  return v110();
}

uint64_t sub_10002B01C()
{
  id v1 = *(void **)(v0 + 1456);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002B230()
{
  id v1 = (void *)v0[185];
  uint64_t v2 = (void *)v0[182];
  uint64_t v3 = v0[167];
  uint64_t v4 = v0[166];
  uint64_t v5 = v0[165];

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002B46C()
{
  id v1 = (void *)v0[185];
  uint64_t v2 = (void *)v0[182];
  uint64_t v3 = v0[167];
  uint64_t v4 = v0[166];
  uint64_t v5 = v0[165];

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002B6A8()
{
  id v1 = (void *)v0[185];
  uint64_t v2 = (void *)v0[182];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10002B8C0()
{
  id v1 = (void *)v0[185];
  uint64_t v2 = (void *)v0[182];
  uint64_t v3 = v0[157];
  uint64_t v4 = v0[155];
  uint64_t v5 = v0[154];

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002BAFC()
{
  id v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1664);
  uint64_t v2 = *(void **)(v0 + 1480);
  uint64_t v3 = *(void **)(v0 + 1456);
  uint64_t v4 = *(void *)(v0 + 1296);
  uint64_t v5 = *(void *)(v0 + 1264);
  uint64_t v6 = *(void *)(v0 + 1256);
  uint64_t v7 = *(void *)(v0 + 1240);
  uint64_t v8 = *(void *)(v0 + 1232);

  v1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_10002BD5C()
{
  id v1 = *(void **)(v0 + 1712);
  uint64_t v2 = *(void **)(v0 + 1480);
  uint64_t v3 = *(void **)(v0 + 1456);
  uint64_t v4 = *(void *)(v0 + 1256);
  uint64_t v5 = *(void *)(v0 + 1240);
  uint64_t v6 = *(void *)(v0 + 1232);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10002BFA8()
{
  uint64_t v1 = *(void *)(v0 + 1752);
  uint64_t v2 = *(void *)(v0 + 1744);
  uint64_t v3 = *(void **)(v0 + 1648);
  uint64_t v4 = *(void *)(v0 + 1796);
  unint64_t v5 = sub_100032AE0(1, (int)*(float *)(v0 + 1792));
  *(void *)(v0 + 384) = v2;
  *(void *)(v0 + 392) = v4;
  *(void *)(v0 + 400) = v1;
  *(void *)(v0 + 408) = v5;
  *(_DWORD *)(v0 + 416) = v6;
  *(_DWORD *)(v0 + 420) = v7;
  *(void *)(v0 + 424) = v8;
  [v3 setTimeRange:v0 + 384];
  uint64_t v9 = *(void **)(v0 + 1712);
  [*(id *)(v0 + 1648) startReading];
  *(void *)(v0 + 1016) = 0;
  id v10 = [v9 copyNextSampleBuffer];
  if (!v10)
  {
    int v67 = *(void **)(v0 + 1712);
    uint64_t v68 = *(void **)(v0 + 1648);
    uint64_t v69 = *(void **)(v0 + 1480);
    uint64_t v70 = *(void **)(v0 + 1456);
    uint64_t v71 = *(void *)(v0 + 1256);
    uint64_t v72 = *(void *)(v0 + 1240);
    uint64_t v73 = *(void *)(v0 + 1232);
    swift_bridgeObjectRelease();
    sub_1000327C0();
    sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
    goto LABEL_39;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)(v0 + 1584);
  int v13 = *(_DWORD *)(v0 + 1784);
  int v14 = *(_DWORD *)(v0 + 1780);
  uint64_t v15 = (opaqueCMSampleBuffer *)v10;
  uint64_t v111 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v14 != v13 && *(void *)(v0 + 1016) == v12) {
    goto LABEL_38;
  }
  uint64_t v110 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1240) + 16);
  uint64_t v16 = *(void *)(v0 + 1208);
  uint64_t v17 = *(void *)(v0 + 1168);
  uint64_t v18 = *(void *)(v0 + 1136);
  uint64_t v19 = *(void *)(v0 + 1104);
  uint64_t v108 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v109 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  id v106 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1352) + 8);
  uint64_t v107 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  uint64_t v104 = (void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  uint64_t v105 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1080) + 8);
  uint64_t v100 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v101 = (void (**)(uint64_t, uint64_t))(v18 + 8);
  uint64_t v102 = (void (**)(uint64_t, uint64_t))(v17 + 8);
  long long v103 = (void (**)(uint64_t, uint64_t))(v16 + 8);
  uint64_t v20 = v11;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v15)) {
      goto LABEL_17;
    }
    uint64_t v21 = *(void *)(v0 + 1584);
    int v22 = *(_DWORD *)(v0 + 1784);
    int v23 = *(_DWORD *)(v0 + 1780);

    uint64_t v24 = *(void *)(v0 + 1016);
    int v25 = v20;
    uint64_t v26 = v25;
    if (v23 != v22 && v24 == v21)
    {
      id v11 = v20;
      uint64_t v15 = v25;
      goto LABEL_38;
    }
    if (!CMSampleBufferGetNumSamples(v25)) {
      break;
    }
    uint64_t v15 = v26;
LABEL_17:
    uint64_t v34 = sub_100032AA0();
    if (!v34)
    {
      int v82 = *(void **)(v0 + 1712);
      uint64_t v83 = v15;
      BOOL v84 = *(void **)(v0 + 1648);
      uint64_t v85 = *(void **)(v0 + 1480);
      char v86 = *(void **)(v0 + 1456);
      uint64_t v87 = *(void *)(v0 + 1240);
      uint64_t v140 = *(void *)(v0 + 1232);
      uint64_t v142 = *(void *)(v0 + 1256);
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10002DE3C((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v142, v140);
      goto LABEL_39;
    }
    uint64_t v35 = (void *)v34;
    uint64_t v138 = v20;
    uint64_t v141 = v15;
    os_log_type_t v36 = sub_100032A50();
    uint64_t v37 = sub_100032B30();
    if (os_log_type_enabled(v37, v36))
    {
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134217984;
      *(void *)(v38 + 4) = *v111;
      _os_log_impl((void *)&_mh_execute_header, v37, v36, "BlastDoor processing thumbnail %ld", (uint8_t *)v38, 0xCu);
      swift_slowDealloc();
    }
    int v135 = *(_DWORD *)(v0 + 1784);
    uint64_t v132 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1488);
    uint64_t v128 = *(void *)(v0 + 1360);
    uint64_t v130 = *(void *)(v0 + 1344);
    uint64_t v39 = *(void *)(v0 + 1256);
    uint64_t v40 = *(void *)(v0 + 1248);
    uint64_t v41 = *(void *)(v0 + 1232);
    uint64_t v42 = *(void *)(v0 + 1224);
    uint64_t v114 = *(void *)(v0 + 1216);
    uint64_t v115 = *(void *)(v0 + 1200);
    uint64_t v43 = *(void *)(v0 + 1192);
    uint64_t v44 = *(void *)(v0 + 1184);
    uint64_t v116 = *(void *)(v0 + 1176);
    uint64_t v118 = *(void *)(v0 + 1160);
    uint64_t v113 = *(void *)(v0 + 1152);
    uint64_t v120 = *(void *)(v0 + 1144);
    uint64_t v122 = *(void *)(v0 + 1128);

    sub_100032AB0();
    sub_100032AF0();
    type metadata accessor for CVBuffer(0);
    uint64_t v45 = sub_100032740();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v43, 1, 1, v45);
    id v46 = v35;
    sub_100032750();
    int v47 = *v110;
    (*v110)(v40, v39, v41);
    sub_1000322E0();
    v47(v40, v39, v41);
    sub_100032300();
    (*v109)(v114, v42, v115);
    (*v108)(v116, v44, v118);
    (*v107)(v120, v113, v122);
    sub_1000323E0();
    sub_100032320();
    int v48 = v132(v128, v130);
    uint64_t v49 = *(void **)(v0 + 1712);
    uint64_t v112 = v46;
    if (v48 == v135)
    {
      uint64_t v119 = *(void **)(v0 + 1648);
      uint64_t v121 = *(void **)(v0 + 1480);
      uint64_t v123 = *(void **)(v0 + 1456);
      uint64_t v88 = *(void *)(v0 + 1360);
      uint64_t v89 = *(void *)(v0 + 1344);
      uint64_t v134 = *(void *)(v0 + 1232);
      uint64_t v137 = *(void *)(v0 + 1256);
      uint64_t v131 = *(void *)(v0 + 1224);
      uint64_t v133 = *(void *)(v0 + 1240);
      uint64_t v127 = *(void *)(v0 + 1184);
      uint64_t v129 = *(void *)(v0 + 1200);
      uint64_t v126 = *(void *)(v0 + 1160);
      uint64_t v124 = *(void *)(v0 + 1128);
      uint64_t v125 = *(void *)(v0 + 1152);
      uint64_t v90 = *(void *)(v0 + 1120);
      uint64_t v91 = *(void *)(v0 + 1112);
      uint64_t v92 = *(void *)(v0 + 1096);
      uint64_t v93 = *(void *)(v0 + 1088);
      uint64_t v117 = *(void *)(v0 + 1072);
      swift_bridgeObjectRelease();
      (*v106)(v88, v89);
      (*v104)(v91, v90, v92);
      sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_100032560();
      sub_10000CE90(&qword_1000435A0);
      sub_1000329C0();
      (*v105)(v93, v117);
      *(void *)(v0 + 968) = 0;
      sub_1000329D0();

      (*v100)(v90, v92);
      (*v101)(v125, v124);
      (*v102)(v127, v126);
      (*v103)(v131, v129);
      (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v137, v134);
      goto LABEL_39;
    }
    (*v106)(*(void *)(v0 + 1360), *(void *)(v0 + 1344));
    id v11 = [v49 copyNextSampleBuffer];

    uint64_t v50 = *(void *)(v0 + 1016);
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      __break(1u);
    }
    *uint64_t v111 = v52;
    if (v11) {
      BOOL v54 = *(_DWORD *)(v0 + 1780) != *(_DWORD *)(v0 + 1784) && v52 == *(void *)(v0 + 1584);
    }
    else {
      BOOL v54 = 1;
    }
    uint64_t v55 = *(void *)(v0 + 1088);
    uint64_t v56 = *(void *)(v0 + 1072);
    (*v104)(*(void *)(v0 + 1112), *(void *)(v0 + 1120), *(void *)(v0 + 1096));
    sub_10002DE3C(&qword_100043608, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_100032560();
    sub_10000CE90(&qword_1000435A0);
    sub_1000329C0();
    (*v105)(v55, v56);
    uint64_t v57 = *(void *)(v0 + 1224);
    uint64_t v136 = *(void *)(v0 + 1184);
    uint64_t v139 = *(void *)(v0 + 1200);
    uint64_t v58 = *(void *)(v0 + 1160);
    uint64_t v59 = *(void *)(v0 + 1152);
    uint64_t v60 = *(void *)(v0 + 1128);
    uint64_t v61 = *(void *)(v0 + 1120);
    uint64_t v62 = *(void *)(v0 + 1096);
    if (v54)
    {
      *(void *)(v0 + 976) = 0;
      sub_1000329D0();
    }

    (*v100)(v61, v62);
    (*v101)(v59, v60);
    (*v102)(v136, v58);
    (*v103)(v57, v139);
    if (!v11)
    {
      uint64_t v94 = *(void **)(v0 + 1712);
      long long v95 = *(void **)(v0 + 1480);
      uint64_t v96 = *(void **)(v0 + 1456);
      uint64_t v97 = *(void *)(v0 + 1256);
      uint64_t v98 = *(void *)(v0 + 1240);
      uint64_t v99 = *(void *)(v0 + 1232);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
      goto LABEL_39;
    }
    uint64_t v63 = *(void *)(v0 + 1584);
    int v64 = *(_DWORD *)(v0 + 1784);
    int v65 = *(_DWORD *)(v0 + 1780);
    uint64_t v66 = *(void *)(v0 + 1016);
    uint64_t v15 = (opaqueCMSampleBuffer *)v11;
    uint64_t v20 = v11;
    if (v65 != v64)
    {
      uint64_t v20 = v11;
      if (v66 == v63) {
        goto LABEL_38;
      }
    }
  }
  while (1)
  {
    uint64_t v28 = *(void *)(v0 + 1584);
    int v29 = *(_DWORD *)(v0 + 1784);
    int v30 = *(_DWORD *)(v0 + 1780);

    uint64_t v31 = *(void *)(v0 + 1016);
    uint64_t v32 = v26;
    uint64_t v15 = v32;
    if (v30 != v29 && v31 == v28) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v32)) {
      goto LABEL_17;
    }
  }
  id v11 = v20;
LABEL_38:
  uint64_t v74 = *(void **)(v0 + 1712);
  uint64_t v75 = *(void **)(v0 + 1480);
  uint64_t v76 = *(void **)(v0 + 1456);
  uint64_t v77 = *(void *)(v0 + 1256);
  uint64_t v78 = *(void *)(v0 + 1240);
  uint64_t v79 = *(void *)(v0 + 1232);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
LABEL_39:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v80 = *(uint64_t (**)(void))(v0 + 8);
  return v80();
}

unint64_t sub_10002CF48(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000CE90(&qword_100043640);
  uint64_t v2 = sub_100032C40();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002E52C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000237B4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100023A54(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002D074(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000CE90(&qword_100043198);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_100023A7C(0, &qword_100043648);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_100032980();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10002D150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000329B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000329A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002D964(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100032990();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002D2F8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002D3D4;
  return v6(a1);
}

uint64_t sub_10002D3D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002D4CC(uint64_t a1)
{
  return sub_1000240F0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10002D4D4()
{
  uint64_t v17 = sub_100032700();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = sub_100032330();
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_10000CE90(&qword_1000435A0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);

  return _swift_deallocObject(v0, v15, v13);
}

uint64_t sub_10002D6B8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100032700() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(sub_100032330() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_10000CE90(&qword_1000435A0) - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = v1 + v8;
  uint64_t v16 = v1 + (v11 & ~v10);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  void *v17 = v2;
  v17[1] = sub_10002D870;
  return sub_10002446C(a1, v12, v13, v14, v15, v16);
}

uint64_t sub_10002D870()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002D964(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_1000435A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002D9C4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002D9FC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10002E594;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000435C0 + dword_1000435C0);
  return v6(a1, v4);
}

uint64_t sub_10002DAB4()
{
  uint64_t v17 = sub_100032700();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = sub_100032330();
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_10000CE90(&qword_1000435A0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);

  return _swift_deallocObject(v0, v15, v13);
}

uint64_t sub_10002DC90(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100032700() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(sub_100032330() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_10000CE90(&qword_1000435A0) - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = v1 + v5;
  uint64_t v13 = v1 + v8;
  uint64_t v14 = v1 + (v11 & ~v10);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = sub_10002D870;
  return sub_100024EC8(a1, v12, v13, v14);
}

uint64_t sub_10002DE3C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002DE84(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000CE90(&qword_100043640);
  uint64_t v6 = sub_100032C30();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100023A54(v24, v35);
      }
      else
      {
        sub_10001DE84((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100032DE0();
      sub_1000328E0();
      uint64_t result = sub_100032E00();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100023A54(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_10002E184(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000237B4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10002E344();
      goto LABEL_7;
    }
    sub_10002DE84(v15, a4 & 1);
    unint64_t v21 = sub_1000237B4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_100032D90();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_1000136B4((uint64_t)v19);
    return sub_100023A54(a1, v19);
  }
LABEL_13:
  sub_10002E2D8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_10002E2D8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100023A54(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_10002E344()
{
  uint64_t v1 = v0;
  sub_10000CE90(&qword_100043640);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100032C20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10001DE84(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_100023A54(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002E52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CE90(&qword_100043650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10002E598(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_10000CE90(&qword_100043170);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  unint64_t v7 = (char *)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)v76 - v9;
  __chkstk_darwin(v8);
  long long v95 = (char *)v76 - v11;
  uint64_t v94 = sub_100032450();
  uint64_t v97 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v96 = (char *)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100032640();
  uint64_t v100 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  long long v103 = (char *)v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100032510();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v101 = v14;
  uint64_t v102 = v15;
  __chkstk_darwin(v14);
  uint64_t v105 = (char *)v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_100032530();
  uint64_t v17 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  uint64_t v99 = (uint64_t)v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000328A0();
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = v1[6];
  unint64_t v20 = v1[7];
  if (v20 >> 60 == 15)
  {
    sub_100032550();
    if (!v2)
    {
      int64_t v22 = (unsigned int *)&enum case for SMSCTPart.Content.attachment(_:);
LABEL_4:
      uint64_t v23 = *v22;
      uint64_t v24 = sub_1000327E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(a1, v23, v24);
      return;
    }
    return;
  }
  uint64_t v92 = v17;
  uint64_t v93 = a1;
  uint64_t v25 = v1[1];
  if (!v25) {
    goto LABEL_18;
  }
  uint64_t v26 = *v1;
  if (v26 == 0x616C702F74786574 && v25 == 0xEA00000000006E69 || (sub_100032D70() & 1) != 0)
  {
    sub_10000EDD8(v21, v20);
    sub_100032890();
    sub_100032880();
    uint64_t v27 = v93;
    sub_100032470();
    if (!v2)
    {
      char v28 = (unsigned int *)&enum case for SMSCTPart.Content.plain(_:);
LABEL_20:
      uint64_t v36 = *v28;
      uint64_t v37 = sub_1000327E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v27, v36, v37);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if ((v26 != 0xD000000000000010 || v25 != 0x80000001000378D0) && (sub_100032D70() & 1) == 0)
  {
LABEL_18:
    sub_10000EDD8(v21, v20);
    sub_10000EDD8(v21, v20);
    uint64_t v27 = v93;
    sub_100032550();
    if (!v2)
    {
      char v28 = (unsigned int *)&enum case for SMSCTPart.Content.attachment(_:);
      goto LABEL_20;
    }
LABEL_21:
    sub_10000EEA8(v21, v20);
    return;
  }
  sub_10000EDD8(v21, v20);
  sub_100032890();
  sub_100032880();
  if (!v29)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56))(v7, 1, 1, v104);
    uint64_t v38 = v93;
    sub_100032430();
    sub_10000EEA8(v21, v20);
    if (v2) {
      return;
    }
    goto LABEL_56;
  }
  id v30 = [self sharedInstance];
  id v31 = objc_allocWithZone((Class)MBDSMSToSuperParserContext);
  NSString v32 = sub_100032840();
  swift_bridgeObjectRelease();
  id v33 = [v31 initWithContent:v32];

  id v88 = v30;
  if (![v30 parseContext:v33])
  {
    uint64_t v39 = v33;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56))(v10, 1, 1, v104);
    uint64_t v38 = v93;
    sub_100032430();
    if (v2)
    {

      goto LABEL_21;
    }
    sub_10000EEA8(v21, v20);

LABEL_56:
    uint64_t v70 = enum case for SMSCTPart.Content.smil(_:);
    uint64_t v71 = sub_1000327E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 104))(v38, v70, v71);
    return;
  }
  id v34 = [v33 body];
  _AttributedString.init(fromNSAttributedString:)(v34, v99);
  uint64_t v35 = v92;
  if (v2)
  {

    goto LABEL_21;
  }
  id v83 = v33;
  id v40 = [v33 orderedParts];
  int v82 = (char *)&type metadata for Any + 8;
  uint64_t v41 = sub_100032980();

  uint64_t v42 = *(void *)(v41 + 16);
  if (!v42)
  {
LABEL_57:
    swift_bridgeObjectRelease();
    uint64_t v72 = v104;
    uint64_t v73 = v95;
    uint64_t v74 = v99;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v95, v99, v104);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v73, 0, 1, v72);
    a1 = v93;
    sub_100032430();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v74, v72);
    sub_10000EEA8(v21, v20);

    int64_t v22 = (unsigned int *)&enum case for SMSCTPart.Content.smil(_:);
    goto LABEL_4;
  }
  unint64_t v43 = 0;
  uint64_t v44 = v41 + 32;
  uint64_t v87 = v102 + 32;
  uint64_t v86 = v100 + 32;
  v76[1] = v97 + 32;
  BOOL v84 = &_swiftEmptyArrayStorage;
  uint64_t v81 = v41;
  uint64_t v78 = v42;
  uint64_t v77 = v41 + 32;
  while (v43 < *(void *)(v41 + 16))
  {
    unint64_t v80 = v43;
    sub_10001DE84(v44 + 32 * v43, (uint64_t)v106);
    sub_100023A7C(0, &qword_100043658);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10000FA90();
      swift_allocError();
      sub_1000327B0();
      swift_willThrow();

      uint64_t v75 = &v109;
      goto LABEL_61;
    }
    id v85 = v107;
    id v45 = [v107 textParts];
    uint64_t v46 = sub_100032980();

    uint64_t v47 = *(void *)(v46 + 16);
    if (v47)
    {
      uint64_t v79 = v46;
      uint64_t v48 = v46 + 32;
      uint64_t v49 = &_swiftEmptyArrayStorage;
      while (1)
      {
        sub_10001DE84(v48, (uint64_t)v106);
        sub_100023A7C(0, &qword_100043660);
        if (!swift_dynamicCast()) {
          break;
        }
        uint64_t v89 = v47;
        uint64_t v91 = v49;
        id v50 = v107;
        id v51 = [v107 contentLocation];
        sub_100032870();

        id v90 = v50;
        id v52 = [v50 text];
        sub_100032870();

        sub_100032500();
        uint64_t v49 = v91;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v49 = (void *)sub_1000301A4(0, v49[2] + 1, 1, (unint64_t)v49, &qword_100043680, (uint64_t (*)(void))&type metadata accessor for SMSParserTextPart, (uint64_t (*)(void))&type metadata accessor for SMSParserTextPart);
        }
        unint64_t v54 = v49[2];
        unint64_t v53 = v49[3];
        if (v54 >= v53 >> 1) {
          uint64_t v49 = (void *)sub_1000301A4(v53 > 1, v54 + 1, 1, (unint64_t)v49, &qword_100043680, (uint64_t (*)(void))&type metadata accessor for SMSParserTextPart, (uint64_t (*)(void))&type metadata accessor for SMSParserTextPart);
        }
        v49[2] = v54 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v102 + 32))((unint64_t)v49+ ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80))+ *(void *)(v102 + 72) * v54, v105, v101);

        v48 += 32;
        uint64_t v47 = v89 - 1;
        uint64_t v35 = v92;
        if (v89 == 1)
        {
          swift_bridgeObjectRelease();
          goto LABEL_41;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10000FA90();
      swift_allocError();
LABEL_60:
      sub_1000327B0();
      swift_willThrow();

      uint64_t v75 = &v108;
LABEL_61:

      sub_10000EEA8(v21, v20);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v99, v104);
      return;
    }
    swift_bridgeObjectRelease();
    uint64_t v49 = &_swiftEmptyArrayStorage;
LABEL_41:
    id v55 = [v85 attachmentParts];
    uint64_t v56 = sub_100032980();

    uint64_t v57 = *(void *)(v56 + 16);
    if (v57)
    {
      uint64_t v91 = v49;
      uint64_t v89 = v56;
      uint64_t v58 = v56 + 32;
      uint64_t v59 = &_swiftEmptyArrayStorage;
      while (1)
      {
        sub_10001DE84(v58, (uint64_t)v106);
        sub_100023A7C(0, &qword_100043668);
        if (!swift_dynamicCast()) {
          break;
        }
        id v90 = v59;
        id v60 = v107;
        id v61 = [v107 contentLocation];
        sub_100032870();

        sub_100032630();
        uint64_t v59 = v90;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v59 = (void *)sub_1000301A4(0, v59[2] + 1, 1, (unint64_t)v59, &qword_100043678, (uint64_t (*)(void))&type metadata accessor for SMSParserAttachmentPart, (uint64_t (*)(void))&type metadata accessor for SMSParserAttachmentPart);
        }
        unint64_t v63 = v59[2];
        unint64_t v62 = v59[3];
        if (v63 >= v62 >> 1) {
          uint64_t v59 = (void *)sub_1000301A4(v62 > 1, v63 + 1, 1, (unint64_t)v59, &qword_100043678, (uint64_t (*)(void))&type metadata accessor for SMSParserAttachmentPart, (uint64_t (*)(void))&type metadata accessor for SMSParserAttachmentPart);
        }
        v59[2] = v63 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v100 + 32))((unint64_t)v59+ ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))+ *(void *)(v100 + 72) * v63, v103, v98);

        v58 += 32;
        --v57;
        uint64_t v35 = v92;
        if (!v57) {
          goto LABEL_49;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000327C0();
      sub_10000FA90();
      swift_allocError();
      goto LABEL_60;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    sub_100032440();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v84 = (void *)sub_1000301A4(0, v84[2] + 1, 1, (unint64_t)v84, &qword_100043670, (uint64_t (*)(void))&type metadata accessor for SMSParserPart, (uint64_t (*)(void))&type metadata accessor for SMSParserPart);
    }
    unint64_t v64 = v80;
    int v65 = v84;
    unint64_t v67 = v84[2];
    unint64_t v66 = v84[3];
    if (v67 >= v66 >> 1)
    {
      int v65 = (void *)sub_1000301A4(v66 > 1, v67 + 1, 1, (unint64_t)v84, &qword_100043670, (uint64_t (*)(void))&type metadata accessor for SMSParserPart, (uint64_t (*)(void))&type metadata accessor for SMSParserPart);
      unint64_t v64 = v80;
    }
    v65[2] = v67 + 1;
    unint64_t v68 = v64 + 1;
    unint64_t v69 = (*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
    BOOL v84 = v65;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))((char *)v65 + v69 + *(void *)(v97 + 72) * v67, v96, v94);

    unint64_t v43 = v68;
    uint64_t v35 = v92;
    uint64_t v41 = v81;
    uint64_t v44 = v77;
    if (v68 == v78) {
      goto LABEL_57;
    }
  }
  __break(1u);
}

uint64_t sub_10002F824()
{
  sub_10000CE90(&qword_100043108);
  uint64_t v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v27 = (uint64_t)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v24 - v3;
  uint64_t v5 = sub_10000CE90(&qword_100043110);
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000CE90(&qword_100043118);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000CE90(&qword_100043120);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CE90(&qword_100043148);
  sub_100032000();
  sub_10000FAE8(v0 + 16, (uint64_t)v29, &qword_100043178);
  sub_10000FAE8((uint64_t)v29, (uint64_t)&v30, &qword_100043178);
  if (!*((void *)&v30 + 1))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_6;
  }
  uint64_t v26 = v11;
  long long v28 = v30;
  sub_10000EF70();
  sub_10000EFC4();
  sub_100032830();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v21 = &qword_100043110;
    uint64_t v20 = (uint64_t)v7;
    goto LABEL_7;
  }
  uint64_t v25 = v12;
  uint64_t v16 = v26;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v26, v7, v8);
  swift_getKeyPath();
  sub_100032010();
  swift_release();
  sub_1000328C0();
  swift_bridgeObjectRelease();
  sub_100031F80();
  swift_bridgeObjectRelease();
  uint64_t v17 = v27;
  sub_10001537C((uint64_t)v4, v27);
  uint64_t v18 = sub_100031FA0();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
  {
    uint64_t v22 = sub_100031F90();
    sub_10000F0CC((uint64_t)v4, &qword_100043108);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v25);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v27, v18);
    return v22;
  }
  sub_10000F0CC((uint64_t)v4, &qword_100043108);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v25);
  uint64_t v20 = v17;
  uint64_t v21 = &qword_100043108;
LABEL_7:
  sub_10000F0CC(v20, v21);
  return 0;
}

uint64_t sub_10002FCF0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000CE90(&qword_1000436B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000110D0(a1, a1[3]);
  sub_100030F00();
  sub_100032E20();
  v11[0] = 0;
  sub_100032CF0();
  if (!v2)
  {
    v11[0] = 1;
    sub_100032CF0();
    v11[0] = 2;
    sub_100032CF0();
    sub_10000FAE8(v3 + 48, (uint64_t)v12, &qword_100043200);
    sub_10000FAE8((uint64_t)v12, (uint64_t)v11, &qword_100043200);
    v10[15] = 3;
    sub_100011168();
    sub_100032D30();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_10002FED8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x2D746E65746E6F63;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 1635017060;
      break;
    default:
      unint64_t result = 1701869940;
      break;
  }
  return result;
}

unint64_t sub_10002FF64(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x2D746E65746E6F63;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 1635017060;
      break;
    default:
      unint64_t result = 1701869940;
      break;
  }
  return result;
}

double sub_10002FFF0@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100030B84(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_100030034(void *a1)
{
  return sub_10002FCF0(a1);
}

uint64_t sub_100030070(unsigned __int8 *a1, char *a2)
{
  return sub_100013A00(*a1, *a2);
}

Swift::Int sub_10003007C()
{
  return sub_100013BD4();
}

uint64_t sub_100030084()
{
  return sub_100013CEC();
}

Swift::Int sub_10003008C()
{
  return sub_100013DAC();
}

uint64_t sub_100030094@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000311F0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000300C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10002FED8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000300F0()
{
  return sub_10002FF64(*v0);
}

uint64_t sub_1000300F8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000311F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_100030120(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10003012C(uint64_t a1)
{
  unint64_t v2 = sub_100030F00();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100030168(uint64_t a1)
{
  unint64_t v2 = sub_100030F00();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000301A4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000CE90(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100032C00();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10003057C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_100030424(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000301A4(a1, a2, a3, a4, &qword_100043688, (uint64_t (*)(void))&type metadata accessor for FileTransferAttribute.AttachmentInfo, (uint64_t (*)(void))&type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

char *sub_100030458(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000CE90(&qword_100043690);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000306D8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003057C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_100032C50();
  __break(1u);
  return result;
}

uint64_t sub_1000306D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_10000CE90(&qword_100043698);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100032C50();
  __break(1u);
  return result;
}

uint64_t destroy for SMSCTPartDictionary(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    return sub_10000EEBC(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for SMSCTPartDictionary(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v5;
  unint64_t v6 = a2 + 6;
  unint64_t v7 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v6;
  }
  else
  {
    uint64_t v8 = *v6;
    sub_10000EDEC(*v6, v7);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v7;
  }
  return a1;
}

void *assignWithCopy for SMSCTPartDictionary(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2 + 6;
  unint64_t v5 = a2[7];
  if (a1[7] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_10000EDEC(*v4, v5);
      uint64_t v8 = a1[6];
      unint64_t v9 = a1[7];
      a1[6] = v7;
      a1[7] = v5;
      sub_10000EEBC(v8, v9);
      return a1;
    }
    sub_100013180((uint64_t)(a1 + 6));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 3) = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_10000EDEC(*v4, v5);
  a1[6] = v6;
  a1[7] = v5;
  return a1;
}

__n128 initializeWithTake for SMSCTPartDictionary(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for SMSCTPartDictionary(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2 + 6;
  unint64_t v8 = a1[7];
  if (v8 >> 60 != 15)
  {
    unint64_t v9 = a2[7];
    if (v9 >> 60 != 15)
    {
      uint64_t v10 = a1[6];
      a1[6] = *v7;
      a1[7] = v9;
      sub_10000EEBC(v10, v8);
      return a1;
    }
    sub_100013180((uint64_t)(a1 + 6));
  }
  *((_OWORD *)a1 + 3) = *(_OWORD *)v7;
  return a1;
}

uint64_t getEnumTagSinglePayload for SMSCTPartDictionary(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SMSCTPartDictionary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SMSCTPartDictionary()
{
  return &type metadata for SMSCTPartDictionary;
}

uint64_t sub_100030B84@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000CE90(&qword_1000436A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000110D0(a1, a1[3]);
  sub_100030F00();
  sub_100032E10();
  if (v2)
  {
    sub_1000136B4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_10000EEA8(0, 0xF000000000000000);
  }
  else
  {
    LOBYTE(v26) = 0;
    uint64_t v9 = sub_100032C80();
    uint64_t v11 = v10;
    uint64_t v25 = v9;
    LOBYTE(v26) = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100032C80();
    uint64_t v14 = v13;
    uint64_t v23 = v12;
    uint64_t v24 = a2;
    LOBYTE(v26) = 2;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100032C80();
    uint64_t v17 = v16;
    uint64_t v22 = v15;
    char v28 = 3;
    sub_100013768();
    swift_bridgeObjectRetain();
    sub_100032CC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v18 = v26;
    unint64_t v19 = v27;
    sub_10000EDD8(v26, v27);
    sub_10000EEA8(0, 0xF000000000000000);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000EDD8(v18, v19);
    sub_10000EEA8(v18, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000136B4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = sub_10000EEA8(v18, v19);
    uint64_t v21 = v24;
    *uint64_t v24 = v25;
    v21[1] = v11;
    v21[2] = v23;
    v21[3] = v14;
    v21[4] = v22;
    v21[5] = v17;
    v21[6] = v18;
    v21[7] = v19;
  }
  return result;
}

unint64_t sub_100030F00()
{
  unint64_t result = qword_1000436A8;
  if (!qword_1000436A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000436A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SMSCTPartDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SMSCTPartDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000310B0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SMSCTPartDictionary.CodingKeys()
{
  return &type metadata for SMSCTPartDictionary.CodingKeys;
}

unint64_t sub_1000310EC()
{
  unint64_t result = qword_1000436B8;
  if (!qword_1000436B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000436B8);
  }
  return result;
}

unint64_t sub_100031144()
{
  unint64_t result = qword_1000436C0;
  if (!qword_1000436C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000436C0);
  }
  return result;
}

unint64_t sub_10003119C()
{
  unint64_t result = qword_1000436C8;
  if (!qword_1000436C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000436C8);
  }
  return result;
}

uint64_t sub_1000311F0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10003DD40;
  v6._object = a2;
  unint64_t v4 = sub_100032C70(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for BasicPreviewImageUnpacker()
{
  return &type metadata for BasicPreviewImageUnpacker;
}

uint64_t sub_10003124C()
{
  return sub_100031E18(&qword_1000436D0, (void (*)(uint64_t))&type metadata accessor for PreviewImage);
}

uint64_t sub_100031294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v18[1] = a3;
  uint64_t v5 = sub_100032730();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000101BC();
  uint64_t v9 = (void *)sub_100032B50();
  sub_10000CE90(&qword_100043190);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100037F60;
  sub_1000326F0();
  uint64_t v11 = sub_100032710();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18[6] = v11;
  v18[7] = v13;
  uint64_t v14 = sub_1000326B0();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_1000101FC();
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v16;
  sub_100032A70();
  sub_1000320A0();

  swift_bridgeObjectRelease();
  v18[4] = a1;
  v18[5] = a2;
  sub_1000322D0();
  return sub_1000326C0();
}

uint64_t sub_100031478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v62 = a3;
  uint64_t v4 = sub_100032460();
  uint64_t v63 = *(void *)(v4 - 8);
  uint64_t v64 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000CE90(&qword_1000436D8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v51 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v51 - v14;
  uint64_t v16 = sub_10000CE90(&qword_1000435F0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100032770();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v73 = (char *)v51 - v24;
  if (sub_1000326E0())
  {
    sub_100032A50();
    sub_1000101BC();
    uint64_t v25 = (void *)sub_100032B50();
    sub_1000320B0();

    sub_1000327C0();
    sub_100031E18((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_1000327B0();
    return swift_willThrow();
  }
  else
  {
    uint64_t v56 = v23;
    uint64_t v57 = v13;
    uint64_t v58 = v6;
    uint64_t v59 = v10;
    id v60 = v15;
    uint64_t v61 = v19;
    uint64_t v27 = sub_100032700();
    uint64_t v71 = v27;
    uint64_t v72 = &protocol witness table for File;
    char v28 = sub_100023AB8(v70);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v28, a1, v27);
    sub_1000322B0();
    uint64_t v29 = sub_100032740();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v18, 1, 1, v29);
    long long v30 = v73;
    sub_100032750();
    unint64_t v31 = sub_1000101BC();
    NSString v32 = (void *)sub_100032B50();
    sub_100032A70();
    sub_1000320A0();

    sub_100032760();
    sub_1000110D0(v70, v71);
    sub_10000CE90((uint64_t *)&unk_1000436E0);
    uint64_t v33 = v66;
    sub_100032400();
    if (v33)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v30, v61);
      return sub_1000136B4((uint64_t)v70);
    }
    else
    {
      v51[1] = v31;
      if (v68 == 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = v69;
      }
      if (v68 == 1) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = v67;
      }
      uint64_t v65 = v34;
      uint64_t v66 = v35;
      if (v68 == 1) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = v68;
      }
      uint64_t v55 = v36;
      sub_1000136B4((uint64_t)v70);
      uint64_t v37 = sub_1000322D0();
      uint64_t v54 = *(void *)(v37 - 8);
      unint64_t v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56);
      uint64_t v38 = (uint64_t)v60;
      v53(v60, 1, 1, v37);
      uint64_t v52 = v20;
      uint64_t v39 = v61;
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v56, v30, v61);
      (*(void (**)(char *, void, uint64_t))(v63 + 104))(v58, enum case for StickerEffect.none(_:), v64);
      id v40 = v30;
      uint64_t v41 = (uint64_t)v57;
      uint64_t v42 = v52;
      sub_1000322C0();
      sub_100031CE8(v38);
      v53((char *)v41, 0, 1, v37);
      uint64_t v43 = v38;
      uint64_t v44 = v54;
      uint64_t v45 = v41;
      uint64_t v46 = v40;
      uint64_t v47 = v39;
      sub_100031D48(v45, v43);
      uint64_t v48 = (uint64_t)v59;
      sub_100031DB0(v43, (uint64_t)v59);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v48, 1, v37) == 1)
      {
        sub_100031CE8(v48);
        uint64_t v49 = v43;
        id v50 = (void *)sub_100032B50();
        sub_100032A70();
        sub_1000320A0();

        sub_1000327C0();
        sub_100031E18((unint64_t *)&qword_100043180, (void (*)(uint64_t))&type metadata accessor for Explosion);
        swift_allocError();
        sub_1000327B0();
        swift_willThrow();
        sub_100031CE8(v49);
        return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v46, v47);
      }
      else
      {
        sub_100031CE8(v43);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v47);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v62, v48, v37);
      }
    }
  }
}

uint64_t sub_100031C60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100032A90();
  uint64_t v4 = v3;
  uint64_t result = sub_100032A80();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = result;
  return result;
}

uint64_t sub_100031CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100031294(a1, a2, a3);
}

uint64_t sub_100031CCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100031478(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_100031CE8(uint64_t a1)
{
  uint64_t v2 = sub_10000CE90(&qword_1000436D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100031D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CE90(&qword_1000436D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CE90(&qword_1000436D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031E18(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100031E60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not parse data", v1, 2u);
}

uint64_t sub_100031ED0()
{
  return NSNotFound.getter();
}

uint64_t sub_100031EE0()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100031EF0()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100031F00()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100031F10()
{
  return _convertNSErrorToError(_:)();
}

void sub_100031F20(NSURL *retstr@<X8>)
{
}

uint64_t sub_100031F30()
{
  return URL.init(string:)();
}

uint64_t sub_100031F40()
{
  return type metadata accessor for URL();
}

NSData sub_100031F50()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100031F60()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031F70()
{
  return type metadata accessor for Date();
}

uint64_t sub_100031F80()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_100031F90()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100031FA0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100031FB0()
{
  return static AVPartialAsyncProperty<A>.naturalSize.getter();
}

uint64_t sub_100031FC0()
{
  return static AVPartialAsyncProperty<A>.nominalFrameRate.getter();
}

uint64_t sub_100031FD0()
{
  return static AVPartialAsyncProperty<A>.preferredTransform.getter();
}

uint64_t sub_100031FE0()
{
  return static AVPartialAsyncProperty<A>.segments.getter();
}

uint64_t sub_100031FF0()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

uint64_t sub_100032000()
{
  return Regex.init(_regexString:version:)();
}

uint64_t sub_100032010()
{
  return Regex.Match.subscript.getter();
}

uint64_t sub_100032020()
{
  return TopLevelDictionary.CodingKeys.stringValue.getter();
}

uint64_t sub_100032030()
{
  return type metadata accessor for TopLevelDictionary.CodingKeys();
}

uint64_t sub_100032040()
{
  return TopLevelDictionary.decryptedData.getter();
}

uint64_t sub_100032050()
{
  return TopLevelDictionary.metadata.getter();
}

uint64_t sub_100032060()
{
  return TopLevelDictionary.encrypted.getter();
}

uint64_t sub_100032070()
{
  return type metadata accessor for TopLevelDictionary();
}

uint64_t sub_100032080()
{
  return RelayGroupMutationMessageUnpacker.init()();
}

uint64_t sub_100032090()
{
  return type metadata accessor for RelayGroupMutationMessageUnpacker();
}

uint64_t sub_1000320A0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000320B0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000320C0()
{
  return LinkIsRichLinkAttribute.init(range:isRichLink:)();
}

uint64_t sub_1000320D0()
{
  return type metadata accessor for LinkIsRichLinkAttribute();
}

void sub_1000320E0(Swift::OpaquePointer allowedImageFormats, Swift::Bool increasedRestrictions)
{
}

void sub_1000320F0(Swift::OpaquePointer codecs)
{
}

uint64_t sub_100032100()
{
  return dispatch thunk of BlastDoorServer.resume(sandboxID:)();
}

uint64_t sub_100032110()
{
  return static BlastDoorServer.service.getter();
}

uint64_t sub_100032120()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_100032130()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_100032140()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_100032150()
{
  return type metadata accessor for BlastDoorServer();
}

uint64_t sub_100032160()
{
  return SMSMessage.SMSFilteringSettings.init(with:smsFilterCapabilitiesOptions:)();
}

uint64_t sub_100032170()
{
  return type metadata accessor for SMSMessage.SMSFilteringSettings();
}

uint64_t sub_100032180()
{
  return type metadata accessor for SMSMessage.FilterSubCategoryType();
}

uint64_t sub_100032190()
{
  return SMSMessage.init(with:filterSubCategory:version:type:recipients:date:sender:iMessageCapability:serviceCenter:originatedDeviceNumber:originatedDeviceEmail:originatedDeviceSIM:subject:contentType:replaceMessage:countryCode:GUID:fallbackHash:items:trackMessage:sendEnabled:foundAppleGUID:groupID:originalGroupID:displayName:originatedDeviceUniqueID:smsFilteringSettings:)();
}

uint64_t sub_1000321A0()
{
  return type metadata accessor for SMSMessage.SMSType();
}

uint64_t sub_1000321B0()
{
  return type metadata accessor for SMSMessage();
}

uint64_t sub_1000321C0()
{
  return type metadata accessor for ReadReceipt();
}

uint64_t sub_1000321D0()
{
  return BasicMessage.participantDestinationIdentifiers.getter();
}

uint64_t sub_1000321E0()
{
  return BasicMessage.init(with:plainTextSubject:content:participantDestinationIdentifiers:)();
}

uint64_t sub_1000321F0()
{
  return BasicMessage.content.getter();
}

uint64_t sub_100032200()
{
  return type metadata accessor for BasicMessage();
}

uint64_t sub_100032210()
{
  return BasicTapBack.MessageSummaryInfo.AssociatedMessageMessageSummaryInfoTypeContentType.init(defaultingRawValue:)();
}

uint64_t sub_100032220()
{
  return type metadata accessor for BasicTapBack.MessageSummaryInfo.AssociatedMessageMessageSummaryInfoTypeContentType();
}

uint64_t sub_100032230()
{
  return BasicTapBack.MessageSummaryInfo.init(with:summary:)();
}

uint64_t sub_100032240()
{
  return type metadata accessor for BasicTapBack.MessageSummaryInfo();
}

uint64_t sub_100032250()
{
  return BasicTapBack.AssociatedMessageType.init(rawValue:)();
}

uint64_t sub_100032260()
{
  return BasicTapBack.AssociatedMessageType.rawValue.getter();
}

uint64_t sub_100032270()
{
  return type metadata accessor for BasicTapBack.AssociatedMessageType();
}

uint64_t sub_100032280()
{
  return BasicTapBack.init(with:associatedMessageGUID:associatedMessageFallbackHash:associatedMessageRange:participantDestinationIdentifiers:messageSummaryInfo:plainTextBody:)();
}

uint64_t sub_100032290()
{
  return PreviewAudio.init(durationValue:powerLevelValues:)();
}

uint64_t sub_1000322A0()
{
  return type metadata accessor for PreviewAudio();
}

uint64_t sub_1000322B0()
{
  return PreviewImage.Constraints.maxPixelDimension.getter();
}

uint64_t sub_1000322C0()
{
  return PreviewImage.init(image:frameCount:frameDuration:isScreenshot:stickerEffect:utTypeString:isMonoskiAsset:alignmentInset:)();
}

uint64_t sub_1000322D0()
{
  return type metadata accessor for PreviewImage();
}

uint64_t sub_1000322E0()
{
  return VideoPreview.VideoFormat.init(trackInfo:)();
}

uint64_t sub_1000322F0()
{
  return type metadata accessor for VideoPreview.VideoFormat();
}

uint64_t sub_100032300()
{
  return VideoPreview.AudioFormat.init(trackInfo:)();
}

uint64_t sub_100032310()
{
  return type metadata accessor for VideoPreview.AudioFormat();
}

uint64_t sub_100032320()
{
  return VideoPreview.Constraints.frameConstraints.getter();
}

uint64_t sub_100032330()
{
  return type metadata accessor for VideoPreview.Constraints();
}

uint64_t sub_100032340()
{
  return type metadata accessor for VideoPreview.FrameConstraints();
}

uint64_t sub_100032350()
{
  return VideoPreview.MultiFrameConstraints.frameLimit.getter();
}

uint64_t sub_100032360()
{
  return VideoPreview.MultiFrameConstraints.framesPerSync.getter();
}

uint64_t sub_100032370()
{
  return VideoPreview.MultiFrameConstraints.uniformSampling.getter();
}

uint64_t sub_100032380()
{
  return VideoPreview.MultiFrameConstraints.targetPixelWidth.getter();
}

uint64_t sub_100032390()
{
  return VideoPreview.MultiFrameConstraints.targetPixelHeight.getter();
}

uint64_t sub_1000323A0()
{
  return VideoPreview.MultiFrameConstraints.appliesPreferredTrackTransform.getter();
}

uint64_t sub_1000323B0()
{
  return type metadata accessor for VideoPreview.MultiFrameConstraints();
}

uint64_t sub_1000323C0()
{
  return VideoPreview.SingleFrameConstraints.maxPixelDimension.getter();
}

uint64_t sub_1000323D0()
{
  return type metadata accessor for VideoPreview.SingleFrameConstraints();
}

uint64_t sub_1000323E0()
{
  return VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)();
}

uint64_t sub_1000323F0()
{
  return type metadata accessor for VideoPreview();
}

uint64_t sub_100032400()
{
  return ImageProvider.withImageSource<A>(_:)();
}

uint64_t sub_100032410()
{
  return LinkAttribute.init(range:link:)();
}

uint64_t sub_100032420()
{
  return type metadata accessor for LinkAttribute();
}

uint64_t sub_100032430()
{
  return SMSCTPartSMIL.init(with:orderedParts:)();
}

uint64_t sub_100032440()
{
  return SMSParserPart.init(with:attachmentParts:)();
}

uint64_t sub_100032450()
{
  return type metadata accessor for SMSParserPart();
}

uint64_t sub_100032460()
{
  return type metadata accessor for StickerEffect();
}

uint64_t sub_100032470()
{
  return SMSCTPartPlain.init(with:)();
}

uint64_t sub_100032480()
{
  return type metadata accessor for DeliveryReceipt();
}

uint64_t sub_100032490()
{
  return type metadata accessor for BasicTextMessage.MessageType();
}

uint64_t sub_1000324A0()
{
  return BasicTextMessage.init(with:messageSubType:threadIdentifierGUID:threadOriginatorFallbackHash:groupID:currentGroupName:groupParticipantVersion:groupProtocolVersion:replicationSourceID:replicatedFallbackGUIDs:)();
}

uint64_t sub_1000324B0()
{
  return type metadata accessor for BasicTextMessage();
}

uint64_t sub_1000324C0()
{
  return BasicAudioMessage.init(with:participantDestinationIdentifiers:inlineAudioMessages:)();
}

uint64_t sub_1000324D0()
{
  return BasicEmojiTapback.AssociatedMessageType.init(rawValue:)();
}

uint64_t sub_1000324E0()
{
  return type metadata accessor for BasicEmojiTapback.AssociatedMessageType();
}

uint64_t sub_1000324F0()
{
  return BasicEmojiTapback.init(with:associatedMessageGUID:associatedMessageFallbackHash:associatedMessageRange:associatedMessageEmoji:participantDestinationIdentifiers:messageSummaryInfo:plainTextBody:)();
}

uint64_t sub_100032500()
{
  return SMSParserTextPart.init(with:text:)();
}

uint64_t sub_100032510()
{
  return type metadata accessor for SMSParserTextPart();
}

uint64_t sub_100032520()
{
  return _AttributedString.init(with:string:)();
}

uint64_t sub_100032530()
{
  return type metadata accessor for _AttributedString();
}

uint64_t sub_100032540()
{
  return UnsupportedMessage.init(with:)();
}

uint64_t sub_100032550()
{
  return SMSCTPartAttachment.init(with:)();
}

uint64_t sub_100032560()
{
  return SessionSchemaResult.init(_:lastResult:)();
}

uint64_t sub_100032570()
{
  return BasicTypingIndicator.init(with:participantDestinationIdentifiers:)();
}

uint64_t sub_100032580()
{
  return MessagePartAttribute.init(range:partNumber:)();
}

uint64_t sub_100032590()
{
  return type metadata accessor for MessagePartAttribute();
}

uint64_t sub_1000325A0()
{
  return FileTransferAttribute.AttachmentInfo.init(with:signature:ownerID:expectedFileSize:encryptionKey:)();
}

uint64_t sub_1000325B0()
{
  return type metadata accessor for FileTransferAttribute.AttachmentInfo();
}

uint64_t sub_1000325C0()
{
  return type metadata accessor for FileTransferAttribute.AttachmentSubtype();
}

uint64_t sub_1000325D0()
{
  return FileTransferAttribute.init(with:attachments:imageInfo:datasize:utiType:mimeType:legacyAnimoji:attachmentSubtype:name:)();
}

uint64_t sub_1000325E0()
{
  return FileTransferAttribute.ImageInfo.init(with:)();
}

uint64_t sub_1000325F0()
{
  return type metadata accessor for FileTransferAttribute.ImageInfo();
}

uint64_t sub_100032600()
{
  return type metadata accessor for FileTransferAttribute();
}

uint64_t sub_100032610()
{
  return GeneralAttachmentInfo.init(with:)();
}

uint64_t sub_100032620()
{
  return type metadata accessor for GeneralAttachmentInfo();
}

uint64_t sub_100032630()
{
  return SMSParserAttachmentPart.init(with:)();
}

uint64_t sub_100032640()
{
  return type metadata accessor for SMSParserAttachmentPart();
}

uint64_t sub_100032650()
{
  return type metadata accessor for RelayGroupMutationMessage();
}

uint64_t sub_100032660()
{
  return AudioMessageAttachmentInfo.init(with:audioTranscription:)();
}

uint64_t sub_100032670()
{
  return type metadata accessor for AudioMessageAttachmentInfo();
}

uint64_t sub_100032680()
{
  return static SMSFilteringSettingsMessage.SMSFilterCapabilitiesOptions.verifiedMask(_:)();
}

uint64_t sub_100032690()
{
  return BaseWritingDirectionAttribute.init(range:direction:)();
}

uint64_t sub_1000326A0()
{
  return type metadata accessor for BaseWritingDirectionAttribute();
}

uint64_t sub_1000326B0()
{
  return >> prefix<A>(_:)();
}

uint64_t sub_1000326C0()
{
  return File.withResource<A>(_:)();
}

BOOL sub_1000326E0()
{
  return File.isAnimatedPNG()();
}

uint64_t sub_1000326F0()
{
  return File.path.getter();
}

uint64_t sub_100032700()
{
  return type metadata accessor for File();
}

uint64_t sub_100032710()
{
  return Path.absolutePath.getter();
}

uint64_t sub_100032720()
{
  return Path.fileURL.getter();
}

uint64_t sub_100032730()
{
  return type metadata accessor for Path();
}

uint64_t sub_100032740()
{
  return type metadata accessor for Image.Encoding();
}

uint64_t sub_100032750()
{
  return Image.init(provider:maxPixelDimension:enforcedEncoding:)();
}

uint64_t sub_100032760()
{
  return Image.provider.getter();
}

uint64_t sub_100032770()
{
  return type metadata accessor for Image();
}

uint64_t sub_100032780()
{
  return Metadata.messageGUID.getter();
}

uint64_t sub_100032790()
{
  return type metadata accessor for Metadata();
}

uint64_t sub_1000327A0()
{
  return Explosion.init(topLevelKey:error:)();
}

uint64_t sub_1000327B0()
{
  return Explosion.init(domain:errorType:keyPath:)();
}

uint64_t sub_1000327C0()
{
  return type metadata accessor for Explosion();
}

uint64_t sub_1000327D0()
{
  return SMSCTPart.init(with:contentId:contentLocation:content:)();
}

uint64_t sub_1000327E0()
{
  return type metadata accessor for SMSCTPart.Content();
}

uint64_t sub_1000327F0()
{
  return type metadata accessor for SMSCTPart();
}

uint64_t sub_100032800()
{
  return type metadata accessor for SandboxID();
}

NSDictionary sub_100032810()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100032820()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032830()
{
  return BidirectionalCollection<>.firstMatch<A, B>(of:)();
}

NSString sub_100032840()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100032850()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100032860()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100032870()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032880()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100032890()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000328A0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000328B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000328C0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_1000328D0()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_1000328E0()
{
  return String.hash(into:)();
}

void sub_1000328F0(Swift::String a1)
{
}

Swift::Int sub_100032900()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100032910()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100032920()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100032940()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100032950()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100032960()
{
  return String.init<A>(_:)();
}

uint64_t sub_100032970()
{
  return String.subscript.getter();
}

uint64_t sub_100032980()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032990()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000329A0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000329B0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000329C0()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_1000329D0()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_1000329E0()
{
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
}

uint64_t sub_1000329F0()
{
  return Double.description.getter();
}

uint64_t sub_100032A00()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100032A10()
{
  return Int.init(truncating:)();
}

uint64_t sub_100032A20()
{
  return CMTimeRange.end.getter();
}

uint64_t sub_100032A30()
{
  return type metadata accessor for AVAssetTrack.Info();
}

uint64_t sub_100032A50()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100032A60()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100032A70()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100032A80()
{
  return CGImageSourceRef.frameCount.getter();
}

uint64_t sub_100032A90()
{
  return CGImageSourceRef.utTypeString.getter();
}

uint64_t sub_100032AA0()
{
  return CMSampleBufferRef.imageBuffer.getter();
}

uint64_t sub_100032AB0()
{
  return CMSampleBufferRef.presentationTimeStamp.getter();
}

uint64_t sub_100032AD0()
{
  return static CMTime.> infix(_:_:)();
}

unint64_t sub_100032AE0(Swift::Int64 value, Swift::Int32 timescale)
{
  return (unint64_t)CMTime.init(value:timescale:)(value, timescale);
}

uint64_t sub_100032AF0()
{
  return CMTime.seconds.getter();
}

uint64_t sub_100032B10()
{
  return static OS_os_log.blastDoor.getter();
}

uint64_t sub_100032B20()
{
  return static OS_os_log.textMessageUnpacker.getter();
}

uint64_t sub_100032B30()
{
  return static OS_os_log.videoPreviewUnpacker.getter();
}

uint64_t sub_100032B40()
{
  return static OS_os_log.basicTextMessageUnpacker.getter();
}

uint64_t sub_100032B50()
{
  return static OS_os_log.image.getter();
}

uint64_t sub_100032B60()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100032B70()
{
  return UInt.init(truncating:)();
}

uint64_t sub_100032B80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100032B90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100032BA0()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_100032BB0(Swift::Int a1)
{
}

uint64_t sub_100032BC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032BD0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032BE0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_100032BF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100032C00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100032C10()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100032C20()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100032C30()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100032C40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100032C50()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100032C70(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100032C80()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100032C90()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100032CA0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100032CB0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100032CC0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100032CD0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100032CE0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100032CF0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100032D00()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100032D10()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100032D20()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100032D30()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100032D40()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100032D50()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100032D60()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100032D70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100032D80()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100032D90()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032DA0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100032DB0()
{
  return Error._code.getter();
}

uint64_t sub_100032DC0()
{
  return Error._domain.getter();
}

uint64_t sub_100032DD0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100032DE0()
{
  return Hasher.init(_seed:)();
}

void sub_100032DF0(Swift::UInt a1)
{
}

Swift::Int sub_100032E00()
{
  return Hasher._finalize()();
}

uint64_t sub_100032E10()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100032E20()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_100032E50()
{
  return _typeName(_:qualified:)();
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetProperty(inAudioFile, inPropertyID, ioDataSize, outPropertyData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetNumSamples(sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return _CMTimeMapTimeFromRangeToRange(retstr, t, fromRange, toRange);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return _ExtAudioFileDispose(inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return _ExtAudioFileGetProperty(inExtAudioFile, inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return _ExtAudioFileOpenURL(inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return _ExtAudioFileRead(inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return _ExtAudioFileSetProperty(inExtAudioFile, inPropertyID, inPropertyDataSize, inPropertyData);
}

uint64_t MBDIMFileTransferKeyForSizeIndex()
{
  return _MBDIMFileTransferKeyForSizeIndex();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
}

uint64_t _CFPrefsSetReadOnly()
{
  return __CFPrefsSetReadOnly();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return _class_getMethodImplementation(cls, name);
}

Class class_getSuperclass(Class cls)
{
  return _class_getSuperclass(cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log2(long double __x)
{
  return _log2(__x);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

uint64_t register_for_dlsym_callbacks()
{
  return _register_for_dlsym_callbacks();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__addAttachmentPartWithSource_toContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAttachmentPartWithSource:toContext:");
}

id objc_msgSend__addPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPart:");
}

id objc_msgSend__clearIvars(void *a1, const char *a2, ...)
{
  return _[a1 _clearIvars];
}

id objc_msgSend__incrementMessagePartNumber(void *a1, const char *a2, ...)
{
  return _[a1 _incrementMessagePartNumber];
}

id objc_msgSend__initIvars(void *a1, const char *a2, ...)
{
  return _[a1 _initIvars];
}

id objc_msgSend__stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForKey:");
}

id objc_msgSend_addAttachmentPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttachmentPart:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTextPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextPart:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFailedGenmojiAttributes(void *a1, const char *a2, ...)
{
  return _[a1 appendFailedGenmojiAttributes];
}

id objc_msgSend_appendFileTransferAttribute_attachments_imageInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFileTransferAttribute:attachments:imageInfo:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendText:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_containsEmojiImageInfoExtractedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsEmojiImageInfoExtractedFrom:");
}

id objc_msgSend_controlCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 controlCharacterSet];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_decrementBoldCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementBoldCount];
}

id objc_msgSend_decrementItalicCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementItalicCount];
}

id objc_msgSend_decrementStrikethroughCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementStrikethroughCount];
}

id objc_msgSend_decrementUnderlineCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementUnderlineCount];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fileAttachmentsExtractedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileAttachmentsExtractedFrom:");
}

id objc_msgSend_fileTransferInfoWithName_partNumber_attachments_imageInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferInfoWithName:partNumber:attachments:imageInfo:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_imageInfoExtractedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageInfoExtractedFrom:");
}

id objc_msgSend_inContentAsData(void *a1, const char *a2, ...)
{
  return _[a1 inContentAsData];
}

id objc_msgSend_incrementBoldCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementBoldCount];
}

id objc_msgSend_incrementItalicCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementItalicCount];
}

id objc_msgSend_incrementStrikethroughCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementStrikethroughCount];
}

id objc_msgSend_incrementUnderlineCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementUnderlineCount];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCharacters:length:");
}

id objc_msgSend_initWithCharactersNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCharactersNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithContentAsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentAsData:");
}

id objc_msgSend_initWithContentLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentLocation:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInteger:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invert(void *a1, const char *a2, ...)
{
  return _[a1 invert];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLivePhotoAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLivePhotoAttribute:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_orderedParts(void *a1, const char *a2, ...)
{
  return _[a1 orderedParts];
}

id objc_msgSend_parser_context_didEndElement_namespaceURI_qualifiedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:context:didEndElement:namespaceURI:qualifiedName:");
}

id objc_msgSend_parser_context_didStartElement_namespaceURI_qualifiedName_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:");
}

id objc_msgSend_parser_context_foundCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:context:foundCharacters:");
}

id objc_msgSend_parser_context_foundIgnorableWhitespace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:context:foundIgnorableWhitespace:");
}

id objc_msgSend_popFontFamily(void *a1, const char *a2, ...)
{
  return _[a1 popFontFamily];
}

id objc_msgSend_popFontSize(void *a1, const char *a2, ...)
{
  return _[a1 popFontSize];
}

id objc_msgSend_popIsRichLink(void *a1, const char *a2, ...)
{
  return _[a1 popIsRichLink];
}

id objc_msgSend_popLink(void *a1, const char *a2, ...)
{
  return _[a1 popLink];
}

id objc_msgSend_pushFontFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushFontFamily:");
}

id objc_msgSend_pushIsRichLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushIsRichLink:");
}

id objc_msgSend_pushLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushLink:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_setBaseWritingDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseWritingDirection:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPowerLevels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerLevels:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByRemovingCharactersFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingCharactersFromSet:");
}

id objc_msgSend_textParts(void *a1, const char *a2, ...)
{
  return _[a1 textParts];
}

id objc_msgSend_trimmedString(void *a1, const char *a2, ...)
{
  return _[a1 trimmedString];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}