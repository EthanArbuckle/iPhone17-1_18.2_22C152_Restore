@interface AVVCStartRecordSettings(debugDescription)
- (id)debugDescription;
@end

@implementation AVVCStartRecordSettings(debugDescription)

- (id)debugDescription
{
  v2 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v2, "appendFormat:", @"[streamHandleId = %d]", objc_msgSend(a1, "streamID"));
  objc_msgSend(v2, "appendFormat:", @"[startHostTime = %llu]", objc_msgSend(a1, "startHostTime"));
  objc_msgSend(v2, "appendFormat:", @"[startAlert = %d]", objc_msgSend(a1, "startAlert"));
  objc_msgSend(v2, "appendFormat:", @"[stopAlert = %d]", objc_msgSend(a1, "stopAlert"));
  objc_msgSend(v2, "appendFormat:", @"[stopOnErrorAlert = %d]", objc_msgSend(a1, "stopOnErrorAlert"));
  int v3 = [a1 skipAlert];
  v4 = @"NO";
  if (v3) {
    v4 = @"YES";
  }
  [v2 appendFormat:@"[skipAlert = %@]", v4];

  return v2;
}

@end