@interface RDUserProfileImpl
- (NSString)assetPath;
- (NSString)language;
- (RDUserProfileImpl)initWithLanguage:(id)a3 assetPath:(id)a4;
- (id)dataProfile;
- (id)readUserProfileFromCache;
- (void)adaptUserProfileWithUserData:(id)a3;
- (void)addPhraseToUserProfileWithIPAprons:(id)a3 wordTag:(id)a4 phrase:(id)a5 pronsArray:(id)a6;
- (void)addPhraseToUserProfileWithTemplateName:(id)a3 wordTag:(id)a4 phrase:(id)a5;
- (void)addWordsToUserProfileWithTemplateName:(id)a3 wordArrays:(id)a4;
- (void)dealloc;
- (void)removeAllWords;
- (void)removeLmeDataForTemplateName:(id)a3;
- (void)setAssetPath:(id)a3;
- (void)setLanguage:(id)a3;
- (void)updateUserProfileWithPersonalData:(id)a3;
- (void)writeUserProfileToCache;
@end

@implementation RDUserProfileImpl

- (RDUserProfileImpl)initWithLanguage:(id)a3 assetPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)RDUserProfileImpl;
  v6 = [(RDUserProfileImpl *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(RDUserProfileImpl *)v6 setLanguage:a3];
    [(RDUserProfileImpl *)v7 setAssetPath:a4];
    v8 = [(NSString *)v7->_assetPath stringByAppendingPathComponent:@"mini.json"];
    v9 = [(NSString *)v7->_assetPath stringByAppendingPathComponent:@"ncs"];
    v7->_userProfile = (_EARUserProfile *)objc_msgSend(objc_alloc((Class)_EARUserProfile), "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:", v8, a3, 0, -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", @"en_US_napg.json"), -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", @"vocdelta.voc"), -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", @"pg.voc"), -[NSString stringByAppendingPathComponent:](v9,
                                              "stringByAppendingPathComponent:",
                                              @"mrec.psh"));
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDUserProfileImpl;
  [(RDUserProfileImpl *)&v3 dealloc];
}

- (void)updateUserProfileWithPersonalData:(id)a3
{
  v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    language = self->_language;
    *(_DWORD *)buf = 138412290;
    v16 = language;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating profile for %@", buf, 0xCu);
  }
  id v8 = [(RDUserProfileImpl *)self readUserProfileFromCache];
  v9 = RXOSLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-using existing profile data", buf, 2u);
    }
    [(_EARUserProfile *)self->_userProfile readUserProfile:v8];
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No existing cache found", buf, 2u);
  }
  objc_initWeak((id *)buf, self);
  objc_super v11 = self->_language;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E75C;
  v13[3] = &unk_1000F0170;
  objc_copyWeak(&v14, (id *)buf);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004E780;
  v12[3] = &unk_1000F01C0;
  v12[4] = self;
  v12[5] = a3;
  +[RDUserData fetchUserDataWithLanguage:v11 keepGoing:v13 completion:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (id)readUserProfileFromCache
{
  v16 = 0;
  id v2 = [(NSString *)self->_language copy];
  id v3 = sub_10004EF34(v2, &v16);
  if (!v3)
  {
    v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v16;
      v13 = "File path for SRC cache not found : %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
LABEL_17:

    return 0;
  }
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v16];
  if (!v4)
  {
    v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v16;
      v13 = "No SpeechProfile cached for SRC : %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v5 = v4;
  id v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v16];

  if (!v6) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  if ((objc_msgSend(objc_msgSend(v6, "valueForKey:", @"language"), "isEqual:", v2) & 1) == 0)
  {
    v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "readUserProfileFromCache: Mismatch in speech profile language in content and filename", buf, 2u);
    }
  }

  id v8 = [v6 valueForKey:@"version"];
  if (([v8 isEqual:@"4.0"] & 1) == 0)
  {
    v15 = RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      CFStringRef v20 = @"4.0";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "readUserProfileFromCache: Profile version on disk (%@) does not match the expected version (%@)", buf, 0x16u);
    }
    return 0;
  }
  id v9 = [v6 valueForKey:@"data"];
  if (v9)
  {
    BOOL v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 length];
      *(_DWORD *)buf = 134217984;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deserialization of user profile done with size=%lu", buf, 0xCu);
    }
  }
  return v9;
}

- (void)writeUserProfileToCache
{
  [+[NSProcessInfo processInfo] systemUptime];
  double v4 = v3;
  NSUInteger v23 = 0;
  id v5 = [(NSString *)self->_language copy];
  id v6 = sub_10004EF34(v5, &v23);
  if (v6)
  {
    id v7 = v6;
    id v8 = [(RDUserProfileImpl *)self dataProfile];
    if (!v8)
    {

      v22 = RXOSLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
      v17 = "Empty data profile";
      id v18 = v22;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 2;
      goto LABEL_19;
    }
    v28[0] = @"data";
    v28[1] = @"version";
    v29[0] = v8;
    v29[1] = @"4.0";
    v28[2] = @"language";
    v29[2] = v5;
    id v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    BOOL v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:&v23];

    id v11 = RXOSLog();
    v12 = v11;
    if (!v10)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 138412290;
      NSUInteger v25 = v23;
      v17 = "Serialization of user profile failed with error=%@";
      id v18 = v12;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v13 = [(NSData *)v10 length];
      *(_DWORD *)buf = 134217984;
      NSUInteger v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Serialization of user profile done with size=%lu", buf, 0xCu);
    }
    if ([(NSData *)v10 writeToFile:v7 options:0x40000000 error:&v23])
    {
      [+[NSProcessInfo processInfo] systemUptime];
      double v15 = v14;
      v16 = RXOSLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 138412546;
      NSUInteger v25 = (NSUInteger)v7;
      __int16 v26 = 2048;
      double v27 = (v15 - v4) * 1000.0;
      v17 = "Persisted user profile to path=%@ in %.2fms";
      id v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 22;
      goto LABEL_19;
    }
    v21 = RXOSLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    NSUInteger v25 = v23;
    v17 = "Persisting user profile to disk failed with error=%@";
  }
  else
  {

    v21 = RXOSLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    NSUInteger v25 = v23;
    v17 = "writeUpdatedUserProfileToCache: Error in getting profile path: %@";
  }
  id v18 = v21;
LABEL_18:
  os_log_type_t v19 = OS_LOG_TYPE_ERROR;
  uint32_t v20 = 12;
LABEL_19:
  _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
}

- (void)addWordsToUserProfileWithTemplateName:(id)a3 wordArrays:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a4);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = +[NSMutableArray array];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10004F1B8;
        v13[3] = &unk_1000F01E8;
        void v13[4] = v11;
        [v10 enumerateKeysAndObjectsUsingBlock:v13];
        [(_EARUserProfile *)self->_userProfile addWordWithParts:v11 templateName:a3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)addPhraseToUserProfileWithTemplateName:(id)a3 wordTag:(id)a4 phrase:(id)a5
{
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a5);
        }
        id v12 = objc_msgSend(objc_alloc((Class)_EARWordPart), "initWithOrthography:pronunciations:tag:", *(void *)(*((void *)&v15 + 1) + 8 * i), +[NSSet set](NSSet, "set"), sub_10004F258((uint64_t)a4));
        [v7 addObject:v12];
      }
      id v9 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  [(_EARUserProfile *)self->_userProfile addWordWithParts:v7 templateName:a3];
}

- (void)addPhraseToUserProfileWithIPAprons:(id)a3 wordTag:(id)a4 phrase:(id)a5 pronsArray:(id)a6
{
  id v11 = +[NSMutableArray array];
  id v12 = objc_msgSend(objc_alloc((Class)_EARWordPart), "initWithOrthography:pronunciations:tagName:frequency:", a5, +[NSSet setWithArray:](NSSet, "setWithArray:", a6), a4, 1);
  NSUInteger v13 = RXOSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138413058;
    id v15 = a5;
    __int16 v16 = 2112;
    id v17 = a6;
    __int16 v18 = 2112;
    id v19 = a4;
    __int16 v20 = 2048;
    uint64_t v21 = 1;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Adding orthography %@ with IPA %@, wordTag: %@, frequency: %lu", (uint8_t *)&v14, 0x2Au);
  }
  [v11 addObject:v12];

  [(_EARUserProfile *)self->_userProfile addWordWithParts:v11 templateName:a3];
}

- (void)adaptUserProfileWithUserData:(id)a3
{
  id v4 = [a3 contactsWords];
  [(RDUserProfileImpl *)self addWordsToUserProfileWithTemplateName:@"\\NT-contact" wordArrays:v4];
}

- (void)removeAllWords
{
}

- (void)removeLmeDataForTemplateName:(id)a3
{
}

- (id)dataProfile
{
  return [(_EARUserProfile *)self->_userProfile dataProfile];
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

@end