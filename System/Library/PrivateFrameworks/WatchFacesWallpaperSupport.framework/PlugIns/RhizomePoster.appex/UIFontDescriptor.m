@interface UIFontDescriptor
+ (id)rhizomeFontDescriptor;
@end

@implementation UIFontDescriptor

+ (id)rhizomeFontDescriptor
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)qword_10004BBF0;
  uint64_t v10 = qword_10004BBF0;
  if (!qword_10004BBF0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000028AC;
    v6[3] = &unk_100044E88;
    v6[4] = &v7;
    sub_1000028AC((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 fontDescriptorForSectName:@"__Rhizome" fromMachO:&_mh_execute_header];
  return v4;
}

@end