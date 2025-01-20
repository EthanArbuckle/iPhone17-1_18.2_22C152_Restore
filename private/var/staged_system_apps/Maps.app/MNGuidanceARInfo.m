@interface MNGuidanceARInfo
- (BOOL)isArrival;
- (NSString)mapsLongDescription;
- (NSString)mapsShortDescription;
- (id)_mapsDescriptionWithInstructionString:(id)a3;
@end

@implementation MNGuidanceARInfo

- (BOOL)isArrival
{
  unsigned int v2 = [(MNGuidanceARInfo *)self maneuverType];
  BOOL result = 1;
  switch(v2)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xCu:
    case 0x11u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x23u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
      BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (id)_mapsDescriptionWithInstructionString:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = [(MNGuidanceARInfo *)self stepIndex];
  id v8 = [(MNGuidanceARInfo *)self eventType];
  if (v8 >= 3)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
  }
  else
  {
    v9 = off_1012ECB88[(int)v8];
  }
  v10 = [(MNGuidanceARInfo *)self arrowLabel];
  v11 = [(MNGuidanceARInfo *)self maneuverRoadName];
  [(MNGuidanceARInfo *)self locationCoordinate];
  uint64_t v13 = v12;
  [(MNGuidanceARInfo *)self locationCoordinate];
  uint64_t v15 = v14;
  [(MNGuidanceARInfo *)self locationCoordinate];
  v17 = +[NSString stringWithFormat:@"<%@: %p, step index: %lu, type: %@, instruction: %@, arrow label: %@, maneuver road name: %@, coordinate: {%f, %f, %f}>", v6, self, v7, v9, v4, v10, v11, v13, v15, v16];

  return v17;
}

- (NSString)mapsShortDescription
{
  v3 = [(MNGuidanceARInfo *)self instructionString];
  id v4 = [v3 stringWithOptions:0];
  v5 = [(MNGuidanceARInfo *)self _mapsDescriptionWithInstructionString:v4];

  return (NSString *)v5;
}

- (NSString)mapsLongDescription
{
  v3 = [(MNGuidanceARInfo *)self instructionString];
  id v4 = [v3 description];
  v5 = [(MNGuidanceARInfo *)self _mapsDescriptionWithInstructionString:v4];

  return (NSString *)v5;
}

@end