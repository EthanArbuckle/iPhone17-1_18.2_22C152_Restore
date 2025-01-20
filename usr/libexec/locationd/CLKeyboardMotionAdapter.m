@interface CLKeyboardMotionAdapter
- (void)eventUpdateForDevice:(id)a3 event:(id)a4;
- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5;
- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation CLKeyboardMotionAdapter

- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5
{
  if (qword_10247F0A0 != -1) {
    dispatch_once(&qword_10247F0A0, &stru_1022D4D58);
  }
  uint64_t v8 = qword_10248A718;

  sub_100964764(v8, (uint64_t)a3, (unsigned __int8 *)a4, a5);
}

- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_10247F0A0 != -1) {
    dispatch_once(&qword_10247F0A0, &stru_1022D4D58);
  }
  v6 = (unsigned char *)qword_10248A718;

  sub_100965004(v6, (uint64_t)a3, v4);
}

- (void)eventUpdateForDevice:(id)a3 event:(id)a4
{
  if (qword_10247F0A0 != -1) {
    dispatch_once(&qword_10247F0A0, &stru_1022D4D58);
  }
  uint64_t v4 = qword_10248A718;

  sub_10096516C(v4);
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  if (qword_10247F0A0 != -1) {
    dispatch_once(&qword_10247F0A0, &stru_1022D4D58);
  }
  uint64_t v4 = qword_10248A718;

  sub_1009652A8(v4, a3);
}

@end