@interface TSTTableKnobAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TSTTableKnobAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableKnob";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  unsigned int v3 = [(TSTTableKnobAccessibility *)self tsaxUnsignedIntValueForKey:@"knobVariant"];
  v4 = [(TSDRepAccessibility *)[(TSDKnobAccessibility *)self tsaxParentRepForKnob] tsaxKnobLabel];
  switch(v3)
  {
    case 1u:
      return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"knob.selection.changer %@"), v4];
    case 9u:
      CFStringRef v5 = @"knob.row.resize";
      break;
    case 5u:
      CFStringRef v5 = @"knob.column.resize";
      break;
    default:
      return 0;
  }

  return TSAccessibilityLocalizedString((uint64_t)v5);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableKnobAccessibility;
  return [(TSTTableKnobAccessibility *)&v3 accessibilityTraits] & ~UIAccessibilityTraitAdjustable;
}

- (BOOL)isAccessibilityElement
{
  unsigned int v3 = [(TSTTableKnobAccessibility *)self tsaxUnsignedIntValueForKey:@"knobVariant"];
  if (v3 <= 8 && ((1 << v3) & 0x114) != 0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSTTableKnobAccessibility;
  return [(TSTTableKnobAccessibility *)&v6 isAccessibilityElement];
}

- (id)accessibilityHint
{
  unsigned int v2 = [(TSTTableKnobAccessibility *)self tsaxUnsignedIntValueForKey:@"knobVariant"];
  switch(v2)
  {
    case 1u:
      CFStringRef v3 = @"knob.selection.changer.hint.iOS";
      break;
    case 5u:
      CFStringRef v3 = @"knob.column.resize.hint.iOS";
      break;
    case 9u:
      CFStringRef v3 = @"knob.row.resize.hint.iOS";
      break;
    default:
      return 0;
  }

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

@end