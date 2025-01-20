@interface PBMigrator
+ (id)sharedMigrator;
- (void)performMigrationIfNeeded;
@end

@implementation PBMigrator

+ (id)sharedMigrator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000762C;
  block[3] = &unk_100030CE0;
  block[4] = a1;
  if (qword_100039528 != -1) {
    dispatch_once(&qword_100039528, block);
  }
  v2 = (void *)qword_100039520;
  return v2;
}

- (void)performMigrationIfNeeded
{
  if (qword_100039538 != -1) {
    dispatch_once(&qword_100039538, &stru_100030D78);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000770C;
  block[3] = &unk_100030D58;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_100039530, block);
}

@end