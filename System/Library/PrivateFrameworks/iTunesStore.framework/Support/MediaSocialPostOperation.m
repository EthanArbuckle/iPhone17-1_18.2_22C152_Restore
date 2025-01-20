@interface MediaSocialPostOperation
- (MediaSocialPostOperation)initWithPostDescription:(id)a3;
- (MediaSocialPostOperation)initWithPostEntity:(id)a3;
- (NSString)userAgent;
- (id)_attachmentDictionaryWithAttachment:(id)a3;
- (id)_externalServiceDictionaryWithDestination:(id)a3;
- (id)_requestBodyDictionary;
- (id)_targetDictionaryWithContentItem:(id)a3;
- (id)resultBlock;
- (int64_t)postID;
- (void)run;
- (void)setPostID:(int64_t)a3;
- (void)setResultBlock:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation MediaSocialPostOperation

- (MediaSocialPostOperation)initWithPostDescription:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MediaSocialPostOperation;
  v5 = [(MediaSocialPostOperation *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountIdentifier];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    uint64_t v8 = [v4 authorIdentifier];
    authorID = v5->_authorID;
    v5->_authorID = (NSString *)v8;

    uint64_t v10 = [v4 authorType];
    authorType = v5->_authorType;
    v5->_authorType = (NSString *)v10;

    uint64_t v12 = [v4 contentItems];
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v12;

    uint64_t v14 = [v4 externalServiceDestinations];
    externalServiceDestinations = v5->_externalServiceDestinations;
    v5->_externalServiceDestinations = (NSArray *)v14;

    uint64_t v16 = [v4 text];
    text = v5->_text;
    v5->_text = (NSString *)v16;

    CFUUIDRef v18 = CFUUIDCreate(0);
    v5->_postIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v18);
    CFRelease(v18);
  }

  return v5;
}

- (MediaSocialPostOperation)initWithPostEntity:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MediaSocialPostOperation;
  v5 = [(MediaSocialPostOperation *)&v17 init];
  if (v5)
  {
    v22[0] = @"account_id";
    v22[1] = @"author_id";
    v22[2] = @"author_type";
    v22[3] = @"is_attributed";
    v22[4] = @"message";
    v22[5] = @"source_app";
    v22[6] = @"creation_time";
    id v21 = 0;
    *(_OWORD *)v19 = 0u;
    *(_OWORD *)objc_super v20 = 0u;
    *(_OWORD *)obj = 0u;
    [v4 getValues:obj forProperties:v22 count:7];
    objc_storeStrong((id *)&v5->_accountID, obj[0]);
    objc_storeStrong((id *)&v5->_authorID, obj[1]);
    objc_storeStrong((id *)&v5->_authorType, v19[0]);
    [v21 doubleValue];
    v5->_createTime = v6;
    v5->_isAttributed = [v19[1] BOOLValue];
    v5->_postIdentifier = (int64_t)[v4 persistentID];
    objc_storeStrong((id *)&v5->_text, v20[0]);
    uint64_t v7 = [v4 uploadedAttachments];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v7;

    uint64_t v9 = [v4 contentItems];
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v9;

    uint64_t v11 = [v4 externalServiceDestinations];
    externalServiceDestinations = v5->_externalServiceDestinations;
    v5->_externalServiceDestinations = (NSArray *)v11;

    if (v20[1])
    {
      uint64_t v13 = sub_1001765D8(v20[1]);
      userAgent = v5->_userAgent;
      v5->_userAgent = (NSString *)v13;
    }
    for (uint64_t i = 6; i != -1; --i)
  }
  return v5;
}

- (id)resultBlock
{
  [(MediaSocialPostOperation *)self lock];
  id v3 = [self->_resultBlock copy];
  [(MediaSocialPostOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  [(MediaSocialPostOperation *)self lock];
  if (self->_resultBlock != v6)
  {
    id v4 = [v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }
  [(MediaSocialPostOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  id v6 = (NSString *)a3;
  [(MediaSocialPostOperation *)self lock];
  if (self->_userAgent != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }
  [(MediaSocialPostOperation *)self unlock];
}

- (NSString)userAgent
{
  [(MediaSocialPostOperation *)self lock];
  id v3 = [(NSString *)self->_userAgent copy];
  [(MediaSocialPostOperation *)self unlock];

  return (NSString *)v3;
}

- (void)run
{
  v65 = objc_alloc_init(MediaSocialPostResponse);
  id v3 = [(MediaSocialPostOperation *)self _requestBodyDictionary];
  id v67 = 0;
  id v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:0 error:&v67];
  id v5 = v67;
  if (v4)
  {
    id v6 = [(MediaSocialPostOperation *)self userAgent];
    uint64_t v7 = +[SSURLBagContext contextWithBagType:0];
    uint64_t v8 = SSHTTPHeaderUserAgent;
    [v7 setValue:v6 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    [v7 setIgnoresCaches:1];
    v64 = [(MediaSocialPostOperation *)self loadedURLBagWithContext:v7 returningError:0];
    if (!v64) {
      goto LABEL_46;
    }
    uint64_t v9 = [v64 valueForKey:SSVURLBagKeyMusicConnect];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 objectForKey:@"createSocialPost"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v62 = [objc_alloc((Class)NSURL) initWithString:v10];

        if (v62)
        {
          id v63 = objc_alloc_init((Class)ISStoreURLOperation);
          v60 = +[NSNumber numberWithInteger:409];
          v68[0] = v60;
          uint64_t v11 = +[NSNumber numberWithInteger:500];
          v68[1] = v11;
          uint64_t v12 = +[NSNumber numberWithInteger:502];
          v68[2] = v12;
          uint64_t v13 = +[NSArray arrayWithObjects:v68 count:3];
          [v63 setPassThroughErrors:v13];

          uint64_t v14 = +[DaemonProtocolDataProvider provider];
          [v63 setDataProvider:v14];

          id v15 = objc_alloc_init((Class)SSMutableURLRequestProperties);
          [v15 setHTTPBody:v4];
          [v15 setHTTPMethod:@"POST"];
          [v15 setURL:v62];
          [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
          [v15 setValue:v6 forHTTPHeaderField:v8];
          SSVAddMediaSocialHeadersToURLRequestProperties();
          [v63 setRequestProperties:v15];
          v61 = v15;
          uint64_t v16 = +[SSLogConfig sharedDaemonConfig];
          if (!v16)
          {
            uint64_t v16 = +[SSLogConfig sharedConfig];
          }
          unsigned int v17 = [v16 shouldLog];
          unsigned int v18 = [v16 shouldLogToDisk];
          v19 = [v16 OSLogObject];
          objc_super v20 = v19;
          if (v18) {
            v17 |= 2u;
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
            v17 &= 2u;
          }
          if (v17)
          {
            id v21 = objc_opt_class();
            int64_t postIdentifier = self->_postIdentifier;
            int v69 = 138412546;
            v70 = v21;
            __int16 v71 = 2048;
            int64_t v72 = postIdentifier;
            id v23 = v21;
            LODWORD(v54) = 22;
            v53 = &v69;
            v24 = (void *)_os_log_send_and_compose_impl();

            if (!v24) {
              goto LABEL_16;
            }
            objc_super v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v69, v54);
            free(v24);
            v53 = (int *)v20;
            SSFileLog();
          }

LABEL_16:
          id v66 = v5;
          unsigned int v25 = [(MediaSocialPostOperation *)self runSubOperation:v63 returningError:&v66];
          id v26 = v66;

          if (!v25)
          {
LABEL_33:

            id v5 = v62;
LABEL_57:

            id v5 = v26;
            goto LABEL_58;
          }
          v27 = [v63 dataProvider];
          v28 = [v27 output];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_32:

            goto LABEL_33;
          }
          v59 = [v28 objectForKey:@"status"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ![v59 isEqualToString:@"error"])
          {
LABEL_31:
            v36 = objc_msgSend(v63, "response", v53);
            -[MediaSocialPostResponse setStatusCode:](v65, "setStatusCode:", objc_msgSend(v36, "itunes_statusCode"));

            [(MediaSocialPostResponse *)v65 setValuesWithResponseDictionary:v28];
            goto LABEL_32;
          }
          v58 = [v28 objectForKey:@"error"];
          v29 = +[SSLogConfig sharedDaemonConfig];
          if (!v29)
          {
            v29 = +[SSLogConfig sharedConfig];
          }
          unsigned int v30 = objc_msgSend(v29, "shouldLog", v53);
          unsigned int v55 = [v29 shouldLogToDisk];
          v57 = v29;
          v31 = [v29 OSLogObject];
          v32 = v31;
          if (v55) {
            v30 |= 2u;
          }
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
            v30 &= 2u;
          }
          if (v30)
          {
            v33 = objc_opt_class();
            int v69 = 138412546;
            v70 = v33;
            __int16 v71 = 2112;
            int64_t v72 = (int64_t)v58;
            id v56 = v33;
            LODWORD(v54) = 22;
            v53 = &v69;
            v34 = (void *)_os_log_send_and_compose_impl();

            if (!v34)
            {
LABEL_30:

              uint64_t v35 = SSError();

              id v26 = (id)v35;
              goto LABEL_31;
            }
            v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v69, v54);
            free(v34);
            v53 = (int *)v32;
            SSFileLog();
          }

          goto LABEL_30;
        }
LABEL_46:
        v43 = +[SSLogConfig sharedDaemonConfig];
        if (!v43)
        {
          v43 = +[SSLogConfig sharedConfig];
        }
        unsigned int v44 = [v43 shouldLog];
        unsigned int v45 = [v43 shouldLogToDisk];
        v46 = [v43 OSLogObject];
        v47 = v46;
        if (v45) {
          v44 |= 2u;
        }
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
          v44 &= 2u;
        }
        if (v44)
        {
          v48 = objc_opt_class();
          int v69 = 138412290;
          v70 = v48;
          id v49 = v48;
          LODWORD(v54) = 12;
          v53 = &v69;
          v50 = (void *)_os_log_send_and_compose_impl();

          if (!v50)
          {
LABEL_56:

            SSError();
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            unsigned int v25 = 0;
            goto LABEL_57;
          }
          v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4, &v69, v54);
          free(v50);
          v53 = (int *)v47;
          SSFileLog();
        }

        goto LABEL_56;
      }
    }
    goto LABEL_46;
  }
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v37 = [v6 shouldLog];
  unsigned int v38 = [v6 shouldLogToDisk];
  v39 = [v6 OSLogObject];
  uint64_t v7 = v39;
  if (v38) {
    v37 |= 2u;
  }
  if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
    v37 &= 2u;
  }
  if (!v37)
  {
LABEL_43:
    unsigned int v25 = 0;
LABEL_58:

    goto LABEL_59;
  }
  v40 = objc_opt_class();
  int v69 = 138412546;
  v70 = v40;
  __int16 v71 = 2112;
  int64_t v72 = (int64_t)v5;
  id v41 = v40;
  LODWORD(v54) = 22;
  v53 = &v69;
  v42 = (void *)_os_log_send_and_compose_impl();

  if (v42)
  {
    uint64_t v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v69, v54);
    free(v42);
    v53 = (int *)v7;
    SSFileLog();
    goto LABEL_43;
  }
  unsigned int v25 = 0;
LABEL_59:

  -[MediaSocialPostOperation setError:](self, "setError:", v5, v53);
  [(MediaSocialPostOperation *)self setSuccess:v25 != 0];
  [(MediaSocialPostResponse *)v65 setError:v5];
  uint64_t v51 = [(MediaSocialPostOperation *)self resultBlock];
  v52 = (void *)v51;
  if (v51)
  {
    (*(void (**)(uint64_t, MediaSocialPostResponse *))(v51 + 16))(v51, v65);
    [(MediaSocialPostOperation *)self setResultBlock:0];
  }
}

- (id)_attachmentDictionaryWithAttachment:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 albumIdentifier];
  if (v6) {
    [v5 setObject:v6 forKey:@"albumId"];
  }
  uint64_t v7 = [v4 assetToken];

  if (v7) {
    [v5 setObject:v7 forKey:@"contentToken"];
  }
  uint64_t v8 = [v4 assetTokenType];

  if (v8) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = @"AssetToken";
  }
  [v5 setObject:v9 forKey:@"contentTokenType"];
  uint64_t v10 = [v4 categoryName];

  if (v10) {
    [v5 setObject:v10 forKey:@"category"];
  }
  uint64_t v11 = [v4 attachmentDescription];

  if (v11) {
    [v5 setObject:v11 forKey:@"description"];
  }
  if ([v4 isExplicitContent]) {
    [v5 setObject:@"Explicit" forKey:@"parentalAdvisoryType"];
  }
  uint64_t v12 = [v4 title];

  if (v12) {
    [v5 setObject:v12 forKey:@"title"];
  }
  authorID = self->_authorID;
  if (authorID)
  {
    [v5 setObject:authorID forKey:@"artistAdamId"];
  }
  else
  {
    accountID = self->_accountID;
    if (accountID)
    {
      id v15 = [(NSNumber *)accountID stringValue];
      [v5 setObject:v15 forKey:@"artistAdamId"];
    }
  }
  id v16 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v17 = [v4 artists];
  v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472;
  v33 = sub_1001777C8;
  v34 = &unk_1003A8428;
  id v18 = v16;
  id v35 = v18;
  [v17 enumerateObjectsUsingBlock:&v31];

  if ([v18 count]) {
    [v5 setObject:v18 forKey:@"allArtistAdamIds"];
  }
  switch((unint64_t)[v4 attachmentType])
  {
    case 1uLL:
      CFStringRef v19 = @"Song";
      goto LABEL_26;
    case 2uLL:
      CFStringRef v20 = @"Image";
      goto LABEL_27;
    case 3uLL:
      CFStringRef v19 = @"SoundBite";
LABEL_26:
      [v5 setObject:v19 forKey:@"audioType"];
      CFStringRef v20 = @"Audio";
LABEL_27:
      [v5 setObject:v20 forKey:@"requestType"];
      break;
    case 4uLL:
      id v21 = objc_alloc((Class)NSString);
      [v4 previewFrameTimestamp];
      id v23 = objc_msgSend(v21, "initWithFormat:", @"%.0f", v22, v31, v32, v33, v34);
      [v5 setObject:v23 forKey:@"previewFrameTimeCode"];
      [v5 setObject:@"Video" forKey:@"requestType"];
      [v5 setObject:@"VideoClip" forKey:@"videoType"];

      break;
    default:
      break;
  }
  v24 = [v4 childAttachmentForRelationship:SSVMediaSocialPostAttachmentRelationshipCoverImage];
  unsigned int v25 = v24;
  if (v24)
  {
    id v26 = [v24 assetToken];
    if (v26) {
      [v5 setObject:v26 forKey:@"coverArtToken"];
    }
    v27 = [v25 assetTokenType];

    if (v27) {
      [v5 setObject:v27 forKey:@"coverArtTokenType"];
    }
  }
  [v4 uploadTime];
  id v29 = [objc_alloc((Class)NSNumber) initWithLongLong:1000 * (uint64_t)v28];
  [v5 setObject:v29 forKey:@"uploadTimestamp"];

  return v5;
}

- (id)_externalServiceDictionaryWithDestination:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 accessToken];
  if (v5) {
    [v4 setObject:v5 forKey:@"accessToken"];
  }
  id v6 = [v3 serviceIdentifier];
  if ([v6 isEqualToString:SSVMediaSocialPostExternalServiceTwitter])
  {
    [v4 setObject:@"twitter" forKey:@"type"];
  }
  else
  {
    uint64_t v7 = [v3 pageIdentifier];
    if (v7) {
      [v4 setObject:v7 forKey:@"pageId"];
    }
    uint64_t v8 = [v3 pageAccessToken];
    if (v8)
    {
      [v4 setObject:v8 forKey:@"pageToken"];
      CFStringRef v9 = @"facebook_page";
    }
    else if (v7)
    {
      CFStringRef v9 = @"facebook_page";
    }
    else
    {
      CFStringRef v9 = @"facebook_wall";
    }
    [v4 setObject:v9 forKey:@"type"];
  }

  return v4;
}

- (id)_requestBodyDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", self->_postIdentifier);
  [v3 setObject:v4 forKey:@"client_post_id"];
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"shareText"];
  }
  p_authorID = &self->_authorID;
  if (!self->_authorID || (p_authorType = &self->_authorType, !self->_authorType))
  {
    p_authorID = &self->_accountID;
    if (!self->_accountID) {
      goto LABEL_8;
    }
    p_authorType = (NSString **)&SSVMediaSocialPostAuthorTypeUser;
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", *p_authorID, @"id", *p_authorType, @"type", 0);
  [v3 setObject:v8 forKey:@"owner"];

LABEL_8:
  if ([(NSArray *)self->_attachments count])
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v10 = self->_attachments;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [(MediaSocialPostOperation *)self _attachmentDictionaryWithAttachment:*(void *)(*((void *)&v44 + 1) + 8 * i)];
          [v9 addObject:v15];
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"content"];
  }
  double createTime = self->_createTime;
  if (createTime > 0.0)
  {
    unsigned int v17 = +[NSNumber numberWithDouble:floor(createTime * 1000.0)];
    [v3 setObject:v17 forKey:@"createTime"];
  }
  if (self->_isAttributed) {
    [v3 setObject:&__kCFBooleanTrue forKey:@"isAttributed"];
  }
  NSUInteger v18 = [(NSArray *)self->_contentItems count];
  contentItems = self->_contentItems;
  if (v18 == 1)
  {
    id v20 = [(NSArray *)contentItems firstObject];
    id v21 = [(MediaSocialPostOperation *)self _targetDictionaryWithContentItem:v20];
    [v3 setObject:v21 forKey:@"target"];
  }
  else
  {
    if ([(NSArray *)contentItems count] < 2) {
      goto LABEL_33;
    }
    id v20 = objc_alloc_init((Class)NSMutableArray);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v22 = self->_contentItems;
    id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [(MediaSocialPostOperation *)self _targetDictionaryWithContentItem:*(void *)(*((void *)&v40 + 1) + 8 * (void)j)];
          [v20 addObject:v27];
        }
        id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v24);
    }

    [v3 setObject:v20 forKey:@"target"];
  }

LABEL_33:
  if ([(NSArray *)self->_externalServiceDestinations count])
  {
    id v28 = objc_alloc_init((Class)NSMutableArray);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v29 = self->_externalServiceDestinations;
    id v30 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [(MediaSocialPostOperation *)self _externalServiceDictionaryWithDestination:*(void *)(*((void *)&v36 + 1) + 8 * (void)k)];
          [v28 addObject:v34];
        }
        id v31 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKey:@"shareTo"];
  }

  return v3;
}

- (id)_targetDictionaryWithContentItem:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 identifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"id"];
  }
  id v6 = [v3 type];

  if (v6) {
    [v4 setObject:v6 forKey:@"type"];
  }

  return v4;
}

- (int64_t)postID
{
  return self->_postID;
}

- (void)setPostID:(int64_t)a3
{
  self->_postID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_externalServiceDestinations, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_authorType, 0);
  objc_storeStrong((id *)&self->_authorID, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end