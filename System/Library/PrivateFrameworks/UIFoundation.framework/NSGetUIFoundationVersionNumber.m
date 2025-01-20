@interface NSGetUIFoundationVersionNumber
@end

@implementation NSGetUIFoundationVersionNumber

void *___NSGetUIFoundationVersionNumber_block_invoke()
{
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "infoDictionary"), "valueForKey:", @"CFBundleVersion");
  if (result)
  {
    result = (void *)[result doubleValue];
    double v2 = floor(v1 + 0.5);
  }
  else
  {
    double v2 = 0.0;
  }
  _NSGetUIFoundationVersionNumber_UIFoundationVersionNumber = *(void *)&v2;
  return result;
}

@end