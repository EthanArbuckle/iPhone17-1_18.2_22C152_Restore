@interface NSString(UIStringDrawing)
- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:;
- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:lineBreakMode:;
- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:;
- (uint64_t)drawAtPoint:()UIStringDrawing withFont:;
- (uint64_t)sizeWithFont:()UIStringDrawing forWidth:lineBreakMode:;
- (uint64_t)sizeWithFont:()UIStringDrawing minFontSize:actualFontSize:forWidth:lineBreakMode:;
- (void)sizeWithFont:()UIStringDrawing;
@end

@implementation NSString(UIStringDrawing)

- (void)sizeWithFont:()UIStringDrawing
{
  if (a3)
  {
    if (*MEMORY[0x1E4F1DB30] >= 0.0) {
      return objc_msgSend((id)objc_msgSend(result, "stringByReplacingOccurrencesOfString:withString:", @"\n", &stru_1ED0E84C0), "_legacy_sizeWithFont:forWidth:lineBreakMode:", a3, 0, 3.40282347e38);
    }
  }
  return result;
}

- (uint64_t)sizeWithFont:()UIStringDrawing forWidth:lineBreakMode:
{
  v8 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v8, "_legacy_sizeWithFont:forWidth:lineBreakMode:", a4, a5, a2);
}

- (uint64_t)drawAtPoint:()UIStringDrawing withFont:
{
  v8 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v8, "_legacy_drawAtPoint:withFont:", a5, a2, a3);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:lineBreakMode:
{
  v12 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v12, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a6, a7, a2, a3, a4);
}

- (uint64_t)sizeWithFont:()UIStringDrawing minFontSize:actualFontSize:forWidth:lineBreakMode:
{
  v12 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v12, "_legacy_sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:", a5, a6, a7, a2, a3);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:
{
  v16 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v16, "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:", a7, a8, a9, a2, a3, a4, a5);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:
{
  v18 = (void *)[a1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];
  return objc_msgSend(v18, "_legacy_drawAtPoint:forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:", a7, a8, a9, a10, a2, a3, a4, a5);
}

@end