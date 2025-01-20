@interface REMColor_Codable
- (REMColor_Codable)init;
- (REMColor_Codable)initWithCKSymbolicColorName:(id)a3 hexString:(id)a4;
- (REMColor_Codable)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4;
- (REMColor_Codable)initWithHexString:(id)a3;
- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7;
- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7 daSymbolicColorName:(id)a8 daHexString:(id)a9 ckSymbolicColorName:(id)a10;
@end

@implementation REMColor_Codable

- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7 daSymbolicColorName:(id)a8 daHexString:(id)a9 ckSymbolicColorName:(id)a10
{
  uint64_t v11 = (uint64_t)a9;
  if (a8)
  {
    uint64_t v17 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v19 = v18;
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v21 = 0;
    if (a10) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    return (REMColor_Codable *)REMColor_Codable.init(red:green:blue:alpha:colorSpace:daSymbolicColorName:daHexString:ckSymbolicColorName:)(a7, a3, a4, a5, a6, v17, v19, v11, v21, v22, v24);
  }
  uint64_t v17 = 0;
  uint64_t v19 = 0;
  if (!a9) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v21 = v20;
  if (!a10) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v22 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v24 = v23;
  return (REMColor_Codable *)REMColor_Codable.init(red:green:blue:alpha:colorSpace:daSymbolicColorName:daHexString:ckSymbolicColorName:)(a7, a3, a4, a5, a6, v17, v19, v11, v21, v22, v24);
}

- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMColor_Codable)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMColor_Codable)initWithHexString:(id)a3
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMColor_Codable)init
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMColor_Codable)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMColor_Codable)initWithCKSymbolicColorName:(id)a3 hexString:(id)a4
{
  result = (REMColor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end