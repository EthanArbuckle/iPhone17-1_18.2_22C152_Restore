@interface GQDTSpiceTableModel
+ (const)stateForReading;
- (__CFArray)createSizeArrayFromPositionVector:(void *)a3;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)setColumnWidthsFromState:(id)a3;
- (int)setRowHeightsFromState:(id)a3;
@end

@implementation GQDTSpiceTableModel

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A0588;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->super.mHeaderRowCount = sub_42DCC(a3, qword_A35E8, (xmlChar *)"tableModelIsHeaderRow", 0);
  self->super.mHeaderColumnCount = sub_42DCC(a3, qword_A35E8, (xmlChar *)"tableModelIsHeaderColumn", 0);
  return 1;
}

- (int)setRowHeightsFromState:(id)a3
{
  v4 = [(GQDTSpiceTableModel *)self createSizeArrayFromPositionVector:*((void *)a3 + 9)];
  self->super.mRowHeights = v4;
  if (!v4) {
    return 3;
  }
  self->super.mRowCount = CFArrayGetCount(v4);
  return 1;
}

- (int)setColumnWidthsFromState:(id)a3
{
  v4 = [(GQDTSpiceTableModel *)self createSizeArrayFromPositionVector:*((void *)a3 + 10)];
  self->super.mColumnWidths = v4;
  if (!v4) {
    return 3;
  }
  self->super.mColumnCount = CFArrayGetCount(v4);
  return 1;
}

- (__CFArray)createSizeArrayFromPositionVector:(void *)a3
{
  uint64_t v3 = *((void *)a3 + 1) - *(void *)a3;
  uint64_t v4 = v3 >> 2;
  if ((int)(v3 >> 2) < 1) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, (v4 - 1), &kCFTypeArrayCallBacks);
  if (*((void *)a3 + 1) == *(void *)a3) {
    goto LABEL_10;
  }
  v7 = Mutable;
  if (v4 >= 2)
  {
    float v8 = **(float **)a3;
    uint64_t v9 = ((unint64_t)v3 >> 2);
    unint64_t v10 = 1;
    while (v10 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2)
    {
      float v11 = *(float *)(*(void *)a3 + 4 * v10);
      float valuePtr = v11 - v8;
      CFNumberRef v12 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
      CFArrayAppendValue(v7, v12);
      CFRelease(v12);
      ++v10;
      float v8 = v11;
      if (v9 == v10) {
        return v7;
      }
    }
LABEL_10:
    sub_1A914();
  }
  return v7;
}

@end