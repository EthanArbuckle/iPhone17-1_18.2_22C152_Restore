@interface SWCollaborationClearNoticeTransmissionMessageGenerator
+ (id)initWithData:(id)a3;
@end

@implementation SWCollaborationClearNoticeTransmissionMessageGenerator

+ (id)initWithData:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE080;
  uint64_t v12 = qword_1000EE080;
  if (!qword_1000EE080)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000ABC0;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_10000ABC0((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithData:v3];

  return v6;
}

@end