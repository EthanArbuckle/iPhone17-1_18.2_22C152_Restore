@interface VKCBaseDataDetectorElement
+ (id)stringArrayForVKDataDetectorTypes:(unint64_t)a3;
+ (unint64_t)dataDetectorTypesForScannerResult:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isInspectableCellSelectable;
- (BOOL)isMRCDataDetector;
- (BOOL)isTextDataDetector;
- (BOOL)isUnitConversionDataDetector;
- (BOOL)wantsMacOSHandCursor;
- (DDScannerResult)scannerResult;
- (NSArray)boundingQuads;
- (NSDictionary)groupedElementData;
- (NSString)description;
- (NSString)stringValue;
- (NSUUID)uuid;
- (UIMenu)debugMenu;
- (VKCBaseDataDetectorElement)init;
- (double)area;
- (double)maxLineHeight;
- (int64_t)elementType;
- (unint64_t)dataDetectorTypes;
- (void)setGroupedElementData:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation VKCBaseDataDetectorElement

- (VKCBaseDataDetectorElement)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKCBaseDataDetectorElement;
  result = [(VKCBaseDataDetectorElement *)&v3 init];
  if (result) {
    result->_area = -1.0;
  }
  return result;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = VKMUIStringForDDTypes([(VKCBaseDataDetectorElement *)self dataDetectorTypes]);
  v6 = [v3 stringWithFormat:@"<%@: %p> : %@", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)elementType
{
  return 2;
}

- (DDScannerResult)scannerResult
{
  return 0;
}

- (NSArray)boundingQuads
{
  return 0;
}

- (unint64_t)dataDetectorTypes
{
  return 0;
}

- (BOOL)isTextDataDetector
{
  return 0;
}

- (BOOL)isMRCDataDetector
{
  return 0;
}

- (BOOL)isUnitConversionDataDetector
{
  return 0;
}

- (BOOL)isInspectableCellSelectable
{
  return 1;
}

- (BOOL)wantsMacOSHandCursor
{
  return ([(VKCBaseDataDetectorElement *)self dataDetectorTypes] & 0x140) != 0;
}

- (double)area
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double result = self->_area;
  if (result <= 0.0)
  {
    self->_area = 0.0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(VKCBaseDataDetectorElement *)self boundingQuads];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v8) area];
          self->_area = v9 + self->_area;
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    return self->_area;
  }
  return result;
}

- (double)maxLineHeight
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double result = self->_maxLineHeight;
  if (result <= 0.0)
  {
    self->_double maxLineHeight = 0.0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(VKCBaseDataDetectorElement *)self boundingQuads];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) sideLength];
          if (maxLineHeight < v10) {
            double maxLineHeight = v10;
          }
          if (self->_maxLineHeight >= maxLineHeight) {
            double maxLineHeight = self->_maxLineHeight;
          }
          self->_double maxLineHeight = maxLineHeight;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    return self->_maxLineHeight;
  }
  return result;
}

- (UIMenu)debugMenu
{
  return 0;
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = [(VKCBaseDataDetectorElement *)self boundingQuads];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__VKCBaseDataDetectorElement_containsPoint___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  char v6 = objc_msgSend(v5, "vk_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __44__VKCBaseDataDetectorElement_containsPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (unint64_t)dataDetectorTypesForScannerResult:(id)a3
{
  id v3 = a3;
  int v4 = [v3 category];
  if (v3)
  {
    switch(v4)
    {
      case 0:
      case 1:
      case 5:
      case 6:
        uint64_t v5 = [v3 type];

        if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F000], v5))
        {
          unint64_t v6 = 16;
          break;
        }
        if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F0E8], v5))
        {
          unint64_t v6 = 8;
          break;
        }
        if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F080], v5))
        {
          unint64_t v6 = 32;
          break;
        }
        if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F068], v5)) {
          goto LABEL_23;
        }
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F5F028], v5, 0)
          && CFStringCompare((CFStringRef)*MEMORY[0x1E4F5F108], v5, 0))
        {
          if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F5F060], v5, 0))
          {
            if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F5F020], v5, 0))
            {
              if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F5EFF8], v5, 0))
              {
                if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F5F090], v5, 0)) {
                  unint64_t v6 = (unint64_t)(CFEqual((CFStringRef)*MEMORY[0x1E4F5F070], v5)) << 11;
                }
                else {
                  unint64_t v6 = 1024;
                }
              }
              else
              {
                unint64_t v6 = 512;
              }
            }
            else
            {
LABEL_23:
              unint64_t v6 = 256;
            }
          }
          else
          {
            unint64_t v6 = 128;
          }
        }
        else
        {
          unint64_t v6 = 64;
        }
        break;
      case 2:
        unint64_t v6 = 1;
        break;
      case 3:
        unint64_t v6 = 2;
        break;
      case 4:
        unint64_t v6 = 4;
        break;
      case 7:
        unint64_t v6 = 0x800000;
        break;
      default:
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)stringValue
{
  id v3 = [(VKCBaseDataDetectorElement *)self scannerResult];
  int v4 = [v3 type];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"Type" withString:&stru_1F35566F8];

  unint64_t v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VKCBaseDataDetectorElement;
  uint64_t v7 = [(VKCBaseElement *)&v10 stringValue];
  uint64_t v8 = [v6 stringWithFormat:@"%@: %@", v5, v7];

  return (NSString *)v8;
}

+ (id)stringArrayForVKDataDetectorTypes:(unint64_t)a3
{
  if (a3)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F1CBF0], "vk_arrayByAddingNonNilObject:", @"Phone Number");
    if ((a3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v4 = (void *)MEMORY[0x1E4F1CBF0];
  if ((a3 & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Address");

    int v4 = (void *)v5;
  }
LABEL_6:
  if ((a3 & 4) != 0)
  {
    uint64_t v8 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Calendar Event");

    int v4 = (void *)v8;
    if ((a3 & 8) == 0)
    {
LABEL_8:
      if ((a3 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v9 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Tracking Number");

  int v4 = (void *)v9;
  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Flight Number");

  int v4 = (void *)v10;
  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Lookup Suggestion");

  int v4 = (void *)v11;
  if ((a3 & 0x40) == 0)
  {
LABEL_11:
    if ((a3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v12 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Web URL");

  int v4 = (void *)v12;
  if ((a3 & 0x80) == 0)
  {
LABEL_12:
    if ((a3 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v13 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Mail URL");

  int v4 = (void *)v13;
  if ((a3 & 0x100) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_25:
  uint64_t v14 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Generic URL");

  int v4 = (void *)v14;
  if ((a3 & 0x200) != 0)
  {
LABEL_14:
    uint64_t v6 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", @"Email");

    int v4 = (void *)v6;
  }
LABEL_15:
  if (a3 == 0x800000)
  {
    uint64_t v7 = @"Proper Name";
  }
  else if (a3)
  {
    if (a3 != -1) {
      goto LABEL_30;
    }
    uint64_t v7 = @"All";
  }
  else
  {
    uint64_t v7 = @"None";
  }
  uint64_t v15 = objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", v7);

  int v4 = (void *)v15;
LABEL_30:
  return v4;
}

- (NSDictionary)groupedElementData
{
  return self->_groupedElementData;
}

- (void)setGroupedElementData:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_groupedElementData, 0);
}

@end