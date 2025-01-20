@interface REMCDFileAttachment
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (id)attachmentRepresentationAndReturnError:(id *)a3;
- (void)prepareForDeletion;
@end

@implementation REMCDFileAttachment

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDFileAttachment"];
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMFileAttachment cdEntityName];
}

- (void)prepareForDeletion
{
  v20.receiver = self;
  v20.super_class = (Class)REMCDFileAttachment;
  [(REMCDObject *)&v20 prepareForDeletion];
  v4 = +[REMLogStore write];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    v8 = +[NSString stringWithFormat:@"%@.%@", v6, v7];
    v9 = [(REMCDObject *)self remObjectID];
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] prepareForDeletion {attachmentID: %{public}@}", buf, 0x16u);
  }
  v10 = [(REMCDObject *)self storeControllerManagedObjectContext];
  if (v10)
  {
    v11 = [(REMCDFileAttachment *)self identifier];
    if (v11)
    {
      v12 = [(REMCDFileAttachment *)self account];
      v13 = [v12 identifier];

      if (v13)
      {
        v14 = [(REMCDFileAttachment *)self sha512Sum];

        if (v14)
        {
          v15 = [(REMCDFileAttachment *)self sha512Sum];
          v16 = [(REMCDFileAttachment *)self fileName];
          v17 = [v16 pathExtension];

          [v10 proposePurgingFileAttachmentWithSha512Sum:v15 fileExtension:v17 account:v13];
        }
        else
        {
          v18 = [v10 fileAttachmentIdentifiersToPurgeByAccountIdentifier];
          v15 = [v18 objectForKey:v13];

          if (!v15)
          {
            v15 = +[NSMutableSet set];
            v19 = [v10 fileAttachmentIdentifiersToPurgeByAccountIdentifier];
            [v19 setObject:v15 forKey:v13];
          }
          [v15 addObject:v11];
        }
      }
      else
      {
        v15 = +[REMLogStore write];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100752F94();
        }
      }
    }
    else
    {
      v13 = +[REMLogStore write];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100752EAC();
      }
    }
  }
  else
  {
    v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100752DC4();
    }
  }
}

- (id)attachmentRepresentationAndReturnError:(id *)a3
{
  return sub_100496B54(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_10049A08C);
}

@end