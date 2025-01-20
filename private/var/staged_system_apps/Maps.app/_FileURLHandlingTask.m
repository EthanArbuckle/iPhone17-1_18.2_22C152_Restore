@interface _FileURLHandlingTask
- (void)performTask;
@end

@implementation _FileURLHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = [(URLHandlingTask *)self url];
  v4 = [v3 pathExtension];
  unsigned int v5 = [v4 isEqual:@"navtrace"];

  if (!v5)
  {
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
      v13 = "_FileURLHandlingTask can not play file (not a navtrace extension)";
      v14 = (uint8_t *)&v16;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    }
LABEL_11:

    [(URLHandlingTask *)self taskFailed];
    return;
  }
  v6 = +[UIApplication sharedMapsDelegate];
  unsigned int v7 = [v6 canPlayTrace];

  if (!v7)
  {
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "_FileURLHandlingTask can not play traces";
      v14 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v8 = [OpenTraceAction alloc];
  v9 = [(URLHandlingTask *)self url];
  v10 = [v9 path];
  v15 = [(OpenTraceAction *)v8 initWithFilePath:v10];

  v11 = [[RichMapsActivity alloc] initWithMapsAction:v15];
  [(URLHandlingTask *)self taskFinished:v11];
}

@end