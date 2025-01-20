@interface SiriTTSTrainerDiagnostics
+ (void)collectTailspin:(id)a3;
+ (void)collectTailspinToFile:(id)a3 minTimestamp:(unint64_t)a4 completion:(id)a5;
@end

@implementation SiriTTSTrainerDiagnostics

+ (void)collectTailspin:(id)a3
{
  id v4 = a3;
  self;
  if (qword_10001D800 != -1) {
    dispatch_once(&qword_10001D800, &stru_100018A08);
  }
  v5 = off_10001D5A8;
  uint64_t v6 = mach_absolute_time();
  v7 = +[NSString stringWithFormat:@"%llu.tailspin", v6];
  self;
  if (qword_10001D810 != -1) {
    dispatch_once(&qword_10001D810, &stru_100018A28);
  }
  double v8 = *(double *)&qword_10001D808;
  v9 = [(__CFString *)v5 stringByAppendingPathComponent:v7];
  v10 = +[NSFileManager defaultManager];
  [v10 createFileAtPath:v9 contents:0 attributes:0];

  v11 = +[NSFileHandle fileHandleForUpdatingAtPath:v9];
  v12 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dumping tailspin to %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000676C;
  v15[3] = &unk_100018A50;
  id v16 = v9;
  id v17 = v4;
  id v13 = v4;
  id v14 = v9;
  [a1 collectTailspinToFile:v11 minTimestamp:v6 + (unint64_t)(v8 * -10.0) completion:v15];
}

+ (void)collectTailspinToFile:(id)a3 minTimestamp:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  double v8 = dispatch_get_global_queue(9, 0);
  v14[0] = UnsafePointer;
  v14[1] = UnsafePointer;
  v15[0] = &__kCFBooleanTrue;
  id v9 = a3;
  v10 = +[NSNumber numberWithUnsignedLongLong:a4];
  v15[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  [v9 fileDescriptor];
  id v13 = v7;
  id v12 = v7;
  tailspin_dump_output_with_options();
}

@end