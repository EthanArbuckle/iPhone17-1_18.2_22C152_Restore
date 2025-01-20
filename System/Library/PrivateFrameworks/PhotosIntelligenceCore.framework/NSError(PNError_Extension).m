@interface NSError(PNError_Extension)
+ (id)_pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:;
+ (id)pn_errorWithCode:()PNError_Extension localizedDescription:;
+ (id)pn_genericErrorWithLocalizedDescription:()PNError_Extension;
+ (id)pn_genericErrorWithMultipleUnderlyingErrors:()PNError_Extension localizedDescription:;
+ (id)pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:;
@end

@implementation NSError(PNError_Extension)

+ (id)pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:
{
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v12 = a3;
  v13 = (__CFString *)CFStringCreateWithFormatAndArguments(v11, 0, a4, &a9);
  v14 = objc_msgSend(a1, "_pn_genericErrorWithUnderlyingError:localizedDescription:", v12, v13);

  return v14;
}

+ (id)pn_genericErrorWithLocalizedDescription:()PNError_Extension
{
  v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3, &a9);
  CFAllocatorRef v11 = objc_msgSend(a1, "_pn_genericErrorWithUnderlyingError:localizedDescription:", 0, v10);

  return v11;
}

+ (id)pn_errorWithCode:()PNError_Extension localizedDescription:
{
  va_start(va, format);
  v6 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, format, va);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];
  v8 = [a1 errorWithDomain:@"PNPhotosIntelligenceErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)pn_genericErrorWithMultipleUnderlyingErrors:()PNError_Extension localizedDescription:
{
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F083F0]];

  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];
  v10 = [a1 errorWithDomain:@"PNPhotosIntelligenceErrorDomain" code:3 userInfo:v9];

  return v10;
}

+ (id)_pn_genericErrorWithUnderlyingError:()PNError_Extension localizedDescription:
{
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08608]];

  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];
  v10 = [a1 errorWithDomain:@"PNPhotosIntelligenceErrorDomain" code:-1 userInfo:v9];

  return v10;
}

@end