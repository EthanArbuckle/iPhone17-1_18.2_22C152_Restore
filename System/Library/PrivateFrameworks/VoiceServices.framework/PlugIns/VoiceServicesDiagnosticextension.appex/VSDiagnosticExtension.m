@interface VSDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation VSDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  v3 = [(VSDiagnosticExtension *)self attachmentList];
  v4 = [v3 sortedArrayUsingComparator:&stru_100004078];

  id v5 = [v4 count];
  if ((unint64_t)v5 >= 0xF) {
    uint64_t v6 = 15;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);

  return v7;
}

- (id)attachmentList
{
  if (_os_feature_enabled_impl())
  {
    v3 = +[NSURL fileURLWithPath:@"/private/var/mobile/Library/Logs/SiriTTSService/"];
    CFStringRef v4 = @".*\\.(caf|tailspin)";
  }
  else
  {
    v3 = +[NSURL fileURLWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/"];
    CFStringRef v4 = @"TTS.*\\.(wav|tailspin)";
  }
  id v5 = +[NSRegularExpression regularExpressionWithPattern:v4 options:1 error:0];
  uint64_t v6 = [(VSDiagnosticExtension *)self filesInDir:v3 matchingPattern:v5 excludingPattern:0];

  return v6;
}

@end