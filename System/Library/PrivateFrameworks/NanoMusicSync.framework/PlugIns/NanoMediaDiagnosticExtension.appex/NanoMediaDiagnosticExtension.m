uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_nanoMusicSyncDefaultsItem(void *a1, const char *a2, ...)
{
  return [a1 nanoMusicSyncDefaultsItem];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
inAccessor) initWithDomain:@"com.apple.NanoMusicSync"];
  v3 = [v2 dictionaryRepresentation];
  NSLog(@"NanoMusicSync defaults: %@", v3);
  v4 = NSTemporaryDirectory();
  v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];

  v6 = [v5 URLByAppendingPathComponent:@"NanoMusicSyncDefaults"];
  v7 = [v6 URLByAppendingPathExtension:@"plist"];

  v13 = 0;
  v8 = [v3 writeToURL:v7 error:&v13];
  v9 = v13;
  v10 = v9;
  if (v8) {
    NSLog(@"Successfully wrote to sync defaults file with URL: %@", v7);
  }
  else {
    NSLog(@"Failed to write to sync defaults file with error: %@", v9);
  }
  v11 = +[DEAttachmentItem attachmentWithPathURL:v7];
  [v11 setDisplayName:@"NanoMusicSyncDefaults"];
  [v11 setDeleteOnAttach:&__kCFBooleanTrue];

  return v11;
}

@end