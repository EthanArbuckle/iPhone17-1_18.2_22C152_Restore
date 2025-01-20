@interface GQDTTableModel
+ (const)stateForReading;
- (BOOL)hasGroupDisplayType:(unsigned __int16)a3 level:(int)a4 displayType:(int *)a5 isTypeVisible:(BOOL *)a6;
- (BOOL)isNameVisible;
- (BOOL)visibilityForColumn:(unsigned __int16)a3;
- (BOOL)visibilityForRow:(unsigned __int16)a3;
- (__CFArray)cells;
- (__CFString)name;
- (float)heightForRow:(unsigned __int16)a3;
- (float)widthForColumn:(unsigned __int16)a3;
- (id)cellAt:(unsigned __int16)a3;
- (int)addColumnWidthFrom:(_xmlTextReader *)a3;
- (int)addGroupLevelsFrom:(_xmlTextReader *)a3;
- (int)addRowHeightFrom:(_xmlTextReader *)a3;
- (int)numGroupLevels;
- (int)readAttributesForGrid:(_xmlTextReader *)a3;
- (int)readAttributesForModel:(_xmlTextReader *)a3;
- (int)typeOfVectorAlongGridline:(unsigned __int16)a3 offset:(unsigned __int16)a4 length:(unsigned __int16)a5 vertical:(BOOL)a6;
- (unsigned)columnCount;
- (unsigned)firstVisibleColumn;
- (unsigned)footerRowCount;
- (unsigned)headerColumnCount;
- (unsigned)headerRowCount;
- (unsigned)rowCount;
- (void)dealloc;
- (void)setCells:(__CFArray *)a3;
- (void)setNumGroupLevels:(int)a3;
@end

@implementation GQDTTableModel

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A0A48;
}

- (void)dealloc
{
  mName = self->mName;
  if (mName) {
    CFRelease(mName);
  }
  mCells = self->mCells;
  if (mCells) {
    CFRelease(mCells);
  }
  mColumnWidths = self->mColumnWidths;
  if (mColumnWidths) {
    CFRelease(mColumnWidths);
  }
  mRowHeights = self->mRowHeights;
  if (mRowHeights) {
    CFRelease(mRowHeights);
  }
  mColumnVisibilities = self->mColumnVisibilities;
  if (mColumnVisibilities) {
    CFRelease(mColumnVisibilities);
  }
  mRowVisibilities = self->mRowVisibilities;
  if (mRowVisibilities) {
    CFRelease(mRowVisibilities);
  }
  mColumnGroupDisplayTypes = self->mColumnGroupDisplayTypes;
  if (mColumnGroupDisplayTypes) {
    CFRelease(mColumnGroupDisplayTypes);
  }
  v10.receiver = self;
  v10.super_class = (Class)GQDTTableModel;
  [(GQDTTableModel *)&v10 dealloc];
}

- (unsigned)columnCount
{
  return self->mColumnCount;
}

- (unsigned)rowCount
{
  return self->mRowCount;
}

- (__CFString)name
{
  return self->mName;
}

- (BOOL)isNameVisible
{
  return self->mNameVisible;
}

- (float)widthForColumn:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  CFIndex Count = CFArrayGetCount(self->mColumnWidths);
  float result = -1.0;
  if (Count > v3)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(self->mColumnWidths, v3);
    float valuePtr = 0.0;
    CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, &valuePtr);
    return valuePtr;
  }
  return result;
}

- (float)heightForRow:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  CFIndex Count = CFArrayGetCount(self->mRowHeights);
  float result = -1.0;
  if (Count > v3)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(self->mRowHeights, v3);
    float valuePtr = 0.0;
    CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, &valuePtr);
    return valuePtr;
  }
  return result;
}

- (BOOL)visibilityForColumn:(unsigned __int16)a3
{
  mColumnVisibilities = self->mColumnVisibilities;
  if (!mColumnVisibilities) {
    return 1;
  }
  unsigned int v5 = a3;
  if (CFArrayGetCount(mColumnVisibilities) <= a3) {
    return 0;
  }
  CFBooleanRef ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->mColumnVisibilities, v5);
  return CFBooleanGetValue(ValueAtIndex) != 0;
}

- (BOOL)visibilityForRow:(unsigned __int16)a3
{
  mRowVisibilities = self->mRowVisibilities;
  if (!mRowVisibilities) {
    return 1;
  }
  unsigned int v5 = a3;
  if (CFArrayGetCount(mRowVisibilities) <= a3) {
    return 0;
  }
  CFBooleanRef ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->mRowVisibilities, v5);
  return CFBooleanGetValue(ValueAtIndex) != 0;
}

- (id)cellAt:(unsigned __int16)a3
{
  return (id)CFArrayGetValueAtIndex(self->mCells, a3);
}

- (__CFArray)cells
{
  return self->mCells;
}

- (unsigned)headerRowCount
{
  return self->mHeaderRowCount;
}

- (unsigned)headerColumnCount
{
  return self->mHeaderColumnCount;
}

- (unsigned)footerRowCount
{
  return self->mFooterRowCount;
}

- (int)typeOfVectorAlongGridline:(unsigned __int16)a3 offset:(unsigned __int16)a4 length:(unsigned __int16)a5 vertical:(BOOL)a6
{
  if (a6)
  {
    int v6 = 0;
    p_mColumnCFIndex Count = &self->mColumnCount;
    p_mHeaderColumnCFIndex Count = &self->mHeaderColumnCount;
    p_mRowCFIndex Count = &self->mRowCount;
    mFooterRowCFIndex Count = self->mFooterRowCount;
    p_mHeaderRowCFIndex Count = &self->mHeaderRowCount;
  }
  else
  {
    mFooterRowCFIndex Count = 0;
    p_mColumnCFIndex Count = &self->mRowCount;
    p_mHeaderColumnCFIndex Count = &self->mHeaderRowCount;
    int v6 = self->mFooterRowCount;
    p_mRowCFIndex Count = &self->mColumnCount;
    p_mHeaderRowCFIndex Count = &self->mHeaderColumnCount;
  }
  unsigned int v12 = *p_mHeaderRowCount;
  int v13 = *p_mColumnCount;
  if (a3) {
    BOOL v14 = v13 == a3;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = v14;
  if (a5 + a4 <= v12)
  {
    LOBYTE(v19) = 1;
    int result = v15;
  }
  else
  {
    BOOL v16 = mFooterRowCount != 0;
    BOOL v17 = *p_mRowCount - mFooterRowCount <= a4;
    if (v15) {
      int v18 = 4;
    }
    else {
      int v18 = 3;
    }
    int v19 = v16 && v17;
    if (v19) {
      int result = v18;
    }
    else {
      int result = 7;
    }
  }
  unsigned int v21 = *p_mHeaderColumnCount;
  if ((v19 & 1) == 0 || !a6)
  {
    if (v21)
    {
      if (!a3) {
        return 1;
      }
      if (v21 > a3) {
        return 0;
      }
      if (v21 == a3) {
        return 2;
      }
    }
    if (!v6) {
      goto LABEL_34;
    }
    if (v13 == a3) {
      return 4;
    }
    int v22 = v13 - v6;
    if (v22 < a3) {
      return 3;
    }
    if (v22 == a3)
    {
      return 5;
    }
    else
    {
LABEL_34:
      if (v15) {
        int v23 = 6;
      }
      else {
        int v23 = 7;
      }
      if ((v19 & 1) == 0) {
        return v23;
      }
    }
  }
  return result;
}

- (BOOL)hasGroupDisplayType:(unsigned __int16)a3 level:(int)a4 displayType:(int *)a5 isTypeVisible:(BOOL *)a6
{
  int v8 = a4;
  int valuePtr = a4;
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->mColumnGroupDisplayTypes, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v14 = 0;
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (CFDictionaryGetValueIfPresent(ValueAtIndex, v11, (const void **)&v14))
    {
      unsigned int v12 = v14;
      *a5 = v14[2];
      *a6 = *((unsigned char *)v12 + 12);
      CFRelease(v11);
      return 1;
    }
    CFRelease(v11);
    int v8 = valuePtr;
  }
  BOOL result = 0;
  if (v8 < self->mNumGroupLevels)
  {
    *a5 = 0;
    *a6 = 1;
  }
  return result;
}

- (unsigned)firstVisibleColumn
{
  if (!self->mColumnVisibilities) {
    return 0;
  }
  unsigned __int16 v3 = 0;
  do
  {
    if (self->mColumnCount <= v3) {
      break;
    }
    if ([(GQDTTableModel *)self visibilityForColumn:v3]) {
      break;
    }
    ++v3;
  }
  while (self->mColumnVisibilities);
  return v3;
}

- (int)numGroupLevels
{
  return self->mNumGroupLevels;
}

- (void)setNumGroupLevels:(int)a3
{
  self->mNumGroupLevels = a3;
}

- (int)readAttributesForModel:(_xmlTextReader *)a3
{
  self->mName = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"name");
  self->mNameVisible = sub_42DCC(a3, qword_A35E8, (xmlChar *)"name-is-visible", 0);
  self->mHeaderRowCFIndex Count = sub_43034(a3, qword_A35E8, (xmlChar *)"num-header-rows", 0);
  self->mHeaderColumnCFIndex Count = sub_43034(a3, qword_A35E8, (xmlChar *)"num-header-columns", 0);
  self->mFooterRowCFIndex Count = sub_43034(a3, qword_A35E8, (xmlChar *)"num-footer-rows", 0);
  return 1;
}

- (int)readAttributesForGrid:(_xmlTextReader *)a3
{
  self->mColumnCFIndex Count = sub_43034(a3, qword_A35E8, (xmlChar *)"numcols", 0);
  self->mRowCFIndex Count = sub_43034(a3, qword_A35E8, (xmlChar *)"numrows", 0);
  self->mColumnWidths = CFArrayCreateMutable(kCFAllocatorDefault, self->mColumnCount, &kCFTypeArrayCallBacks);
  self->mRowHeights = CFArrayCreateMutable(kCFAllocatorDefault, self->mRowCount, &kCFTypeArrayCallBacks);
  self->mColumnVisibilities = CFArrayCreateMutable(kCFAllocatorDefault, self->mColumnCount, &kCFTypeArrayCallBacks);
  self->mRowVisibilities = CFArrayCreateMutable(kCFAllocatorDefault, self->mRowCount, &kCFTypeArrayCallBacks);
  self->mColumnGroupDisplayTypes = CFArrayCreateMutable(kCFAllocatorDefault, self->mColumnCount, &kCFTypeArrayCallBacks);
  return 1;
}

- (int)addColumnWidthFrom:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"width");
  *(float *)&double v5 = v5;
  int valuePtr = LODWORD(v5);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  CFArrayAppendValue(self->mColumnWidths, v6);
  CFRelease(v6);
  uint64_t v7 = sub_42F04(a3, qword_A35E8, (xmlChar *)"hiding-state", 0);
  int v8 = (const void **)&kCFBooleanTrue;
  if (v7) {
    int v8 = (const void **)&kCFBooleanFalse;
  }
  CFArrayAppendValue(self->mColumnVisibilities, *v8);
  return 1;
}

- (int)addRowHeightFrom:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"height");
  *(float *)&double v5 = v5;
  int valuePtr = LODWORD(v5);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  CFArrayAppendValue(self->mRowHeights, v6);
  CFRelease(v6);
  uint64_t v7 = sub_42F04(a3, qword_A35E8, (xmlChar *)"hiding-state", 0);
  int v8 = (const void **)&kCFBooleanTrue;
  if (v7) {
    int v8 = (const void **)&kCFBooleanFalse;
  }
  CFArrayAppendValue(self->mRowVisibilities, *v8);
  return 1;
}

- (int)addGroupLevelsFrom:(_xmlTextReader *)a3
{
  self->mNumGroupLevels = sub_42F04(a3, qword_A35E8, (xmlChar *)"levels", 0);
  return 1;
}

- (void)setCells:(__CFArray *)a3
{
  mCells = self->mCells;
  if (mCells) {
    CFRelease(mCells);
  }
  self->mCells = a3;
}

@end