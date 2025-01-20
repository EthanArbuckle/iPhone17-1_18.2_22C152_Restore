@interface NSHTTPURLResponse(MSVAdditions)
- (__CFString)msv_protocolVersion;
@end

@implementation NSHTTPURLResponse(MSVAdditions)

- (__CFString)msv_protocolVersion
{
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  v1 = (__CFString *)CFHTTPMessageCopyVersion(HTTPResponse);
  return v1;
}

@end