@interface NSRTFWriter
+ (double)cocoaVersion;
+ (void)initialize;
- (BOOL)_canWriteColor:(BOOL)result;
- (CFDataRef)writeLinkInfo:(CFDataRef)result;
- (__CFString)_plainFontNameForFont:(uint64_t)a1;
- (const)writeColor:(uint64_t)a3 type:;
- (const)writeShadow:(const char *)result;
- (id)_writeTextScalingAndRenderingHint;
- (id)initWithAttributedString:(void *)a1;
- (id)writeBackgroundColor;
- (id)writeBody;
- (id)writeDefaultTabInterval;
- (id)writeHeader;
- (id)writeHyphenation;
- (id)writeKeywordsDocumentAttribute;
- (uint64_t)RTF;
- (uint64_t)RTFD;
- (uint64_t)_addColor:(uint64_t)result;
- (uint64_t)_attachmentData;
- (uint64_t)_markerStringAtCharacterIndex:(uint64_t)a1;
- (uint64_t)_mostCompatibleCharset:(uint64_t)result;
- (uint64_t)_setTextScalingConversionSource:(uint64_t)result;
- (uint64_t)_setTextScalingConversionTarget:(uint64_t)result;
- (uint64_t)_writeVersionsAndEncodings;
- (uint64_t)collectResources;
- (uint64_t)setDocumentAttributes:(uint64_t)result;
- (uint64_t)textFlowWithAttributes:(NSUInteger *)a3 range:;
- (uint64_t)writeAttachment:(uint64_t)result editableData:(void *)a2 editableTypeIdentifier:;
- (uint64_t)writeBaselineOffset:(uint64_t)result;
- (uint64_t)writeCellTerminator:(uint64_t)a3 atIndex:(unint64_t)a4 nestingLevel:;
- (uint64_t)writeCharacterShape:(uint64_t)result;
- (uint64_t)writeDate:(uint64_t)result;
- (uint64_t)writeDateDocumentAttribute:(const char *)a3 withRTFKeyword:;
- (uint64_t)writeEscapedUTF8String:(uint64_t)result;
- (uint64_t)writeExpansion:(uint64_t)result;
- (uint64_t)writeFont:(char)a3 forceFontNumber:;
- (uint64_t)writeFontTable;
- (uint64_t)writeGlyphInfo:(uint64_t)result;
- (uint64_t)writeHighlightColorScheme:(uint64_t)result;
- (uint64_t)writeHighlightColorSchemeTable;
- (uint64_t)writeHighlightStyle:(uint64_t)result;
- (uint64_t)writeHighlightStyleTable;
- (uint64_t)writeImageGlyph:(uint64_t)a3 attributes:;
- (uint64_t)writeInfo;
- (uint64_t)writeKern:(uint64_t)result;
- (uint64_t)writeLigature:(uint64_t)result;
- (uint64_t)writeListTable;
- (uint64_t)writeObliqueness:(uint64_t)result;
- (uint64_t)writePaperSize;
- (uint64_t)writeParagraphStyle:(uint64_t)result;
- (uint64_t)writeRTF;
- (uint64_t)writeStrikethroughStyle:(uint64_t)result;
- (uint64_t)writeStringDocumentAttribute:(const char *)a3 withRTFKeyword:;
- (uint64_t)writeStrokeWidth:(uint64_t)result;
- (uint64_t)writeSuperscript:(uint64_t)result;
- (uint64_t)writeTableHeader:(uint64_t)a3 atIndex:(uint64_t)a4 nestingLevel:;
- (uint64_t)writeTextFlow:(uint64_t)result;
- (uint64_t)writeUnderlineStyle:(uint64_t)result allowStrikethrough:(void *)a2;
- (unint64_t)writeCharacterAttributes:(void *)a3 previousAttributes:;
- (unint64_t)writeColorTable;
- (void)RTFDFileWrapper;
- (void)_setRTFDFileWrapper:(void *)result;
- (void)dealloc;
- (void)restoreAttributes:(uint64_t)a1;
@end

@implementation NSRTFWriter

- (uint64_t)writeEscapedUTF8String:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = [a2 UTF8String];
  v4 = (unsigned char *)v3;
  v5 = (unsigned char *)v3;
  while (1)
  {
    int v6 = *v4;
    if (v6 == 92)
    {
      objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:");
      int v6 = *v4;
      v5 = v4;
      goto LABEL_7;
    }
    if (!*v4) {
      break;
    }
LABEL_7:
    if (v6 == 125 || v6 == 123)
    {
      [*(id *)(v2 + 8) appendBytes:v5 length:v3 - (void)v5];
      [*(id *)(v2 + 8) appendBytes:"\\"" length:1];
      v5 = v4;
    }
    ++v4;
    ++v3;
  }
  v7 = *(void **)(v2 + 8);

  return [v7 appendBytes:v5 length:v3 - (void)v5];
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSRTFWriteOpenStepCompatibleEncodings");
    if (v3) {
      generateOpenStepCompatible = [v3 BOOLValue];
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSRTFWritePreserveNaturalAlignment"))__NSPreserveNaturalAlignment = 1; {
  }
    }
}

- (uint64_t)_mostCompatibleCharset:(uint64_t)result
{
  if (result)
  {
    result = CFStringConvertNSStringEncodingToEncoding([a2 mostCompatibleStringEncoding]);
    unsigned int v2 = result;
    if (result <= 0xFE && generateOpenStepCompatible)
    {
      switch((int)result)
      {
        case 0:
          return result;
        case 1:
          goto LABEL_16;
        case 2:
          goto LABEL_18;
        case 3:
          goto LABEL_17;
        case 4:
          goto LABEL_15;
        case 5:
          goto LABEL_14;
        case 6:
          goto LABEL_13;
        case 7:
          goto LABEL_6;
        default:
          result = 77;
          switch(v2)
          {
            case 0x15u:
              goto LABEL_10;
            case 0x16u:
            case 0x17u:
            case 0x18u:
            case 0x1Au:
            case 0x1Bu:
            case 0x1Cu:
              return result;
            case 0x19u:
              goto LABEL_12;
            case 0x1Du:
              goto LABEL_8;
            case 0x1Eu:
              goto LABEL_11;
            default:
              if (v2 == 35) {
                goto LABEL_20;
              }
              break;
          }
          break;
      }
    }
    else
    {
      int v3 = result - 1280;
      result = 0;
      switch(v3)
      {
        case 0:
          return result;
        case 1:
LABEL_8:
          result = 238;
          break;
        case 2:
LABEL_6:
          result = 204;
          break;
        case 3:
LABEL_13:
          result = 161;
          break;
        case 4:
LABEL_20:
          result = 162;
          break;
        case 5:
LABEL_14:
          result = 177;
          break;
        case 6:
LABEL_15:
          result = 178;
          break;
        case 7:
          result = 186;
          break;
        case 8:
LABEL_11:
          result = 163;
          break;
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
LABEL_23:
          if (v2 > 0xFE) {
            result = 0;
          }
          else {
            result = v2 + 77;
          }
          break;
        case 16:
          result = 130;
          break;
        default:
          switch(v2)
          {
            case 0x41Du:
LABEL_10:
              result = 222;
              break;
            case 0x41Eu:
            case 0x41Fu:
              goto LABEL_23;
            case 0x420u:
LABEL_16:
              result = 128;
              break;
            case 0x421u:
LABEL_12:
              result = 134;
              break;
            case 0x422u:
LABEL_17:
              result = 129;
              break;
            case 0x423u:
LABEL_18:
              result = 136;
              break;
            default:
              if (v2 != 33) {
                goto LABEL_23;
              }
              result = 2;
              break;
          }
          break;
      }
    }
  }
  return result;
}

- (id)initWithAttributedString:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v4 = [a1 zone];
    v9.receiver = v2;
    v9.super_class = (Class)NSRTFWriter;
    id v2 = objc_msgSendSuper2(&v9, sel_init);
    if (v2)
    {
      *((void *)v2 + 1) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA58], "allocWithZone:", v4), "init");
      *((void *)v2 + 2) = a2;
      *((void *)v2 + 3) = [a2 length];
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      if (SystemEncoding <= 0xFE && generateOpenStepCompatible) {
        CFStringEncoding SystemEncoding = 0;
      }
      *((void *)v2 + 20) = 0x407B000000000000;
      int v6 = *((_DWORD *)v2 + 38);
      if (__NSPreserveNaturalAlignment) {
        int v7 = 16;
      }
      else {
        int v7 = 0;
      }
      *((_DWORD *)v2 + 37) = SystemEncoding;
      *((_DWORD *)v2 + 38) = v6 & 0xFFFFFFEF | v7;
      *((void *)v2 + 24) = -1;
      *((void *)v2 + 25) = -1;
    }
  }
  return v2;
}

- (void)dealloc
{
  NSZoneFree(0, self->_layoutSections);
  v3.receiver = self;
  v3.super_class = (Class)NSRTFWriter;
  [(NSRTFWriter *)&v3 dealloc];
}

- (uint64_t)RTFD
{
  if (result)
  {
    uint64_t v1 = result;
    *(_DWORD *)(result + 152) |= 0x80u;
    result = [-[NSRTFWriter RTFDFileWrapper]((void *)result) serializedRepresentation];
    *(_DWORD *)(v1 + 152) &= ~0x80u;
  }
  return result;
}

- (void)RTFDFileWrapper
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_allocWithZone(MEMORY[0x1E4F28CF0]);
    objc_super v3 = (void *)[v2 initDirectoryWithFileWrappers:MEMORY[0x1E4F1CC08]];
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28CF0]);
    v5 = objc_msgSend(v4, "initRegularFileWithContents:", objc_msgSend(MEMORY[0x1E4F1C9B8], "data"));
    -[NSRTFWriter _setRTFDFileWrapper:](v1, v3);
    [v5 setPreferredFilename:@"TXT.rtf"];
    [v3 addFileWrapper:v5];
    -[NSRTFWriter writeRTF]((uint64_t)v1);
    uint64_t v6 = v1[1];
    [v3 removeFileWrapper:v5];

    [v3 addRegularFileWithContents:v6 preferredFilename:@"TXT.rtf"];
    return v3;
  }
  return result;
}

- (void)_setRTFDFileWrapper:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    id v4 = (void *)result[4];
    if (v4 != a2)
    {

      result = a2;
      v3[4] = result;
    }
  }
  return result;
}

- (uint64_t)RTF
{
  if (result)
  {
    uint64_t v1 = result;
    -[NSRTFWriter writeRTF](result);
    return *(void *)(v1 + 8);
  }
  return result;
}

- (uint64_t)setDocumentAttributes:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(void **)(result + 168);
    if (v4 != a2)
    {

      id v5 = a2;
      *(void *)(v3 + 168) = v5;
      uint64_t v6 = [v5 objectForKey:@"PaperMargin"];
      int v7 = *(void **)(v3 + 168);
      if (v6)
      {
        v8 = (void *)v6;
        int v7 = (void *)[*(id *)(v3 + 168) mutableCopy];
        [v8 UIEdgeInsetsValue];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"TopMargin");
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v10), @"LeftMargin");
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v14), @"RightMargin");
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v12), @"BottomMargin");

        *(void *)(v3 + 168) = v7;
      }
      v15 = (void *)[v7 objectForKey:@"PaperSize"];
      if (v15)
      {
        [v15 sizeValue];
        double v17 = v16;
      }
      else
      {
        double v17 = 612.0;
      }
      v18 = (void *)[*(id *)(v3 + 168) objectForKey:@"LeftMargin"];
      double v19 = 90.0;
      double v20 = 90.0;
      if (v18)
      {
        [v18 doubleValue];
        double v20 = v21;
      }
      v22 = (void *)[*(id *)(v3 + 168) objectForKey:@"RightMargin"];
      if (v22)
      {
        [v22 doubleValue];
        double v19 = v23;
      }
      *(double *)(v3 + 160) = v17 - (v20 + v19);
      v24 = (void *)[*(id *)(v3 + 168) objectForKey:@"NSTextLayoutSectionsAttribute"];
      result = [v24 count];
      if (result)
      {
        uint64_t v25 = [v24 count];
        result = (uint64_t)NSAllocateCollectable(24 * v25 + 24, 0);
        *(void *)(v3 + 176) = result;
        if (result)
        {
          uint64_t v26 = result;
          uint64_t v27 = *(void *)(v3 + 24);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __37__NSRTFWriter_setDocumentAttributes___block_invoke;
          v28[3] = &__block_descriptor_56_e15_v32__0_8Q16_B24l;
          v28[4] = result;
          v28[5] = 0;
          v28[6] = v27;
          [v24 enumerateObjectsUsingBlock:v28];
          result = CFQSortArray();
          *(_OWORD *)(v26 + 24 * v25) = xmmword_18E5F72A0;
        }
      }
    }
  }
  return result;
}

uint64_t __37__NSRTFWriter_setDocumentAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSUInteger location = [a2 objectForKey:@"NSTextLayoutSectionRange"];
  uint64_t v7 = *(void *)(a1 + 32);
  if (location)
  {
    v13.NSUInteger location = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"NSTextLayoutSectionRange"), "rangeValue");
    NSRange v9 = NSIntersectionRange(v13, *(NSRange *)(a1 + 40));
    NSUInteger length = v9.length;
    NSUInteger location = v9.location;
  }
  else
  {
    NSUInteger length = 0;
  }
  uint64_t v10 = 3 * a3;
  double v11 = (NSUInteger *)(v7 + 8 * v10);
  *double v11 = location;
  v11[1] = length;
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"NSTextLayoutSectionOrientation"), "unsignedIntegerValue");
  *(void *)(*(void *)(a1 + 32) + 8 * v10 + 16) = result;
  return result;
}

- (uint64_t)writeRTF
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    if (!*(void *)(result + 40))
    {
      -[NSRTFWriter collectResources](result);
      [v1[1] appendBytes:"{" length:1];
      -[NSRTFWriter writeHeader](v1);
      -[NSRTFWriter writeBody](v1);
      id v2 = v1[1];
      return [v2 appendBytes:"}" length:1];
    }
  }
  return result;
}

- (uint64_t)collectResources
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(result + 40) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", objc_msgSend((id)result, "zone")), "initWithCapacity:", 10);
    *(void *)(v1 + 48) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 10);
    *(void *)(v1 + 56) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 4);
    *(void *)(v1 + 64) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 4);
    *(void *)(v1 + 208) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(v1 + 216) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(v1 + 72) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", objc_msgSend((id)v1, "zone")), "init");
    id v2 = (void *)_rtfBlackColor();
    -[NSRTFWriter _addColor:](v1, v2);
    uint64_t v3 = (void *)_rtfWhiteColor();
    uint64_t result = -[NSRTFWriter _addColor:](v1, v3);
    if (*(void *)(v1 + 24))
    {
      uint64_t v33 = 0;
      unint64_t v4 = 0;
      unint64_t v35 = 0;
      CFStringRef attribute = (const __CFString *)*MEMORY[0x1E4F245D0];
      unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        id v5 = (void *)[*(id *)(v1 + 16) attributesAtIndex:v4 effectiveRange:&v44];
        uint64_t v6 = (void *)[v5 objectForKeyedSubscript:@"NSParagraphStyle"];
        uint64_t v7 = (void *)[v6 textBlocks];
        uint64_t v8 = [v7 count];
        NSRange v9 = (UIFont *)[v5 objectForKeyedSubscript:@"NSFont"];
        if (v9 || (NSRange v9 = (UIFont *)NSDefaultFont()) != 0)
        {
          uint64_t v10 = -[NSRTFWriter _plainFontNameForFont:](v1, v9);
          if (![*(id *)(v1 + 40) objectForKeyedSubscript:v10])
          {
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"), v10);
            [*(id *)(v1 + 48) setObject:v9 forKeyedSubscript:v10];
            ++v33;
          }
          CFTypeRef v11 = CTFontCopyAttribute((CTFontRef)v9, attribute);
          double v12 = (id)CFMakeCollectable(v11);
        }
        else
        {
          double v12 = 0;
        }
        -[NSRTFWriter _addColor:](v1, (void *)[v5 objectForKeyedSubscript:@"NSColor"]);
        -[NSRTFWriter _addColor:](v1, (void *)[v5 objectForKeyedSubscript:@"NSBackgroundColor"]);
        -[NSRTFWriter _addColor:](v1, (void *)[v5 objectForKeyedSubscript:@"NSStrokeColor"]);
        -[NSRTFWriter _addColor:](v1, (void *)[v5 objectForKeyedSubscript:@"NSUnderlineColor"]);
        -[NSRTFWriter _addColor:](v1, (void *)[v5 objectForKeyedSubscript:@"NSStrikethroughColor"]);
        uint64_t v13 = [v5 objectForKeyedSubscript:@"NSTextHighlightStyle"];
        if (v13)
        {
          uint64_t v14 = v13;
          if (-[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightStyles](NSRTFReader, "defaultTextHighlightStyles"), "indexOfObject:", v13) == 0x7FFFFFFFFFFFFFFFLL&& [*(id *)(v1 + 208) indexOfObject:v14] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [*(id *)(v1 + 208) addObject:v14];
          }
          v15 = (void *)[v5 objectForKeyedSubscript:@"NSTextHighlightColorScheme"];
          if (v15)
          {
            double v16 = v15;
            if (([v15 isEqualToString:@"NSTextHighlightColorSchemeDefault"] & 1) == 0
              && -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightColorSchemes](NSRTFReader, "defaultTextHighlightColorSchemes"), "indexOfObject:", v16) == 0x7FFFFFFFFFFFFFFFLL&& [*(id *)(v1 + 216) indexOfObject:v16] == 0x7FFFFFFFFFFFFFFFLL)
            {
              [*(id *)(v1 + 216) addObject:v16];
            }
          }
        }
        uint64_t result = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"NSShadow"), "shadowColor");
        if (result)
        {
          double v42 = 0.0;
          double v43 = 0.0;
          double v41 = 0.0;
          [(id)RGBColorForColor((void *)result) getRed:&v43 green:&v42 blue:&v41 alpha:0];
          double v17 = v42;
          double v18 = v43;
          double v19 = v41;
          Class NSColorClass_5 = getNSColorClass_5();
          if (v18 == v17 && v17 == v19) {
            double v21 = (void *)[(objc_class *)NSColorClass_5 colorWithCalibratedWhite:v43 alpha:1.0];
          }
          else {
            double v21 = (void *)[(objc_class *)NSColorClass_5 colorWithCalibratedRed:v43 green:v42 blue:v41 alpha:1.0];
          }
          uint64_t result = -[NSRTFWriter _addColor:](v1, v21);
        }
        if (v8)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            double v23 = (void *)[v7 objectAtIndex:i];
            -[NSRTFWriter _addColor:](v1, (void *)[v23 backgroundColor]);
            -[NSRTFWriter _addColor:](v1, (void *)[v23 borderColorForEdge:0]);
            -[NSRTFWriter _addColor:](v1, (void *)[v23 borderColorForEdge:2]);
            -[NSRTFWriter _addColor:](v1, (void *)[v23 borderColorForEdge:1]);
            -[NSRTFWriter _addColor:](v1, (void *)[v23 borderColorForEdge:3]);
            objc_opt_class();
            uint64_t result = objc_opt_isKindOfClass();
            if (result)
            {
              v24 = (void *)[v23 table];
              -[NSRTFWriter _addColor:](v1, (void *)[v24 backgroundColor]);
              -[NSRTFWriter _addColor:](v1, (void *)[v24 borderColorForEdge:0]);
              -[NSRTFWriter _addColor:](v1, (void *)[v24 borderColorForEdge:2]);
              -[NSRTFWriter _addColor:](v1, (void *)[v24 borderColorForEdge:1]);
              uint64_t result = -[NSRTFWriter _addColor:](v1, (void *)[v24 borderColorForEdge:3]);
            }
          }
        }
        if (v4 >= v36 && v4 - v36 < v35) {
          goto LABEL_34;
        }
        uint64_t result = [v6 textLists];
        if (result)
        {
          uint64_t v25 = (void *)result;
          uint64_t result = [(id)result count];
          if (result) {
            break;
          }
        }
        unint64_t v35 = 0;
        unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12)
        {
LABEL_37:
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v28 = (void *)[v12 allValues];
          uint64_t result = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (result)
          {
            uint64_t v29 = result;
            uint64_t v30 = *(void *)v38;
            do
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v28);
                }
                v32 = (void *)[(objc_class *)getNSColorClass_5() colorWithCGColor:*(void *)(*((void *)&v37 + 1) + 8 * v31)];
                -[NSRTFWriter _addColor:](v1, v32);
                ++v31;
              }
              while (v29 != v31);
              uint64_t result = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
              uint64_t v29 = result;
            }
            while (result);
          }
        }
LABEL_44:
        unint64_t v4 = v45 + v44;
        if ((unint64_t)(v45 + v44) >= *(void *)(v1 + 24)) {
          return result;
        }
      }
      uint64_t v26 = objc_msgSend(*(id *)(v1 + 16), "rangeOfTextList:atIndex:", objc_msgSend(v25, "objectAtIndex:", 0), v4);
      unint64_t v35 = v27;
      unint64_t v36 = v26;
      uint64_t result = objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:"));
LABEL_34:
      if (v12) {
        goto LABEL_37;
      }
      goto LABEL_44;
    }
  }
  return result;
}

- (id)writeHeader
{
  if (result)
  {
    uint64_t v1 = result;
    -[NSRTFWriter _writeVersionsAndEncodings]((uint64_t)result);
    -[NSRTFWriter _writeTextScalingAndRenderingHint](v1);
    -[NSRTFWriter writeFontTable]((uint64_t)v1);
    -[NSRTFWriter writeColorTable]((unint64_t)v1);
    -[NSRTFWriter writeHighlightStyleTable]((uint64_t)v1);
    -[NSRTFWriter writeHighlightColorSchemeTable]((uint64_t)v1);
    -[NSRTFWriter writeListTable]((uint64_t)v1);
    -[NSRTFWriter writeInfo]((uint64_t)v1);
    -[NSRTFWriter writePaperSize]((uint64_t)v1);
    -[NSRTFWriter writeHyphenation](v1);
    -[NSRTFWriter writeDefaultTabInterval](v1);
    return -[NSRTFWriter writeBackgroundColor](v1);
  }
  return result;
}

- (id)writeBody
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  unint64_t v1 = (unint64_t)result;
  NSUInteger v115 = 0;
  unint64_t v116 = 0;
  uint64_t v114 = 0;
  memset(v113, 0, sizeof(v113));
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t result = (id *)[result[2] string];
  unint64_t v2 = *(void *)(v1 + 24);
  long long v112 = v2;
  *((void *)&v111 + 1) = result;
  if (!v2) {
    return result;
  }
  uint64_t v3 = (__CFString *)result;
  uint64_t v4 = v2 >= 0x20 ? 32 : v2;
  unint64_t v110 = v4;
  uint64_t result = (id *)objc_msgSend(result, sel_getUid("getCharacters:range:"));
  NSUInteger v5 = v115;
  NSUInteger v6 = *(void *)(v1 + 24);
  *(void *)&long long v111 = 1;
  LOWORD(v114) = v113[0];
  if (v115 >= v6) {
    return result;
  }
  uint64_t v7 = 0;
  char v107 = 0;
  char v8 = 0;
  uint64_t v103 = 0;
  v102 = 0;
  NSRange v9 = 0;
  uint64_t v99 = 0;
  char v10 = 1;
  v100 = v3;
  do
  {
    CFTypeRef v11 = (void *)[*(id *)(v1 + 16) attributesAtIndex:v5 longestEffectiveRange:&v115 inRange:0];
    double v12 = v11;
    NSUInteger v13 = v115 - v5;
    if (v115 < v5)
    {
      NSUInteger v115 = v5;
      v116 += v13;
    }
    v104 = v11;
    if ((v10 & 1) == 0) {
      goto LABEL_36;
    }
    v108 = v7;
    uint64_t v14 = (NSParagraphStyle *)[v11 objectForKey:@"NSParagraphStyle"];
    v15 = [(NSParagraphStyle *)v14 textBlocks];
    double v16 = [(NSParagraphStyle *)v14 textLists];
    if (v14)
    {
      if (v15) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v14 = +[NSParagraphStyle defaultParagraphStyle];
      if (v15)
      {
LABEL_15:
        uint64_t v17 = [(NSArray *)v15 count];
        if (v17)
        {
          uint64_t v18 = v17;
          if (([(NSArray *)v15 isEqual:v9] & 1) == 0)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              id v20 = [(NSArray *)v15 objectAtIndex:i];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v21 = [v20 table];
                if (v21)
                {
                  v22 = (void *)v21;
                  if ([*(id *)(v1 + 16) _atStartOfTextTableRow:v21 atIndex:v115]) {
                    -[NSRTFWriter writeTableHeader:atIndex:nestingLevel:](v1, v22, v115, i);
                  }
                }
              }
            }
          }
        }
      }
    }
    -[NSRTFWriter writeParagraphStyle:](v1, v14);
    if ([(NSArray *)v16 count])
    {
      uint64_t v23 = [*(id *)(v1 + 72) count];
      uint64_t v3 = v100;
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = 0;
        while (1)
        {
          unint64_t v26 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 72), "objectAtIndex:", v25), "rangeValue");
          if (v115 >= v26 && v115 - v26 < v27) {
            break;
          }
          if (v24 == ++v25) {
            goto LABEL_34;
          }
        }
        snprintf(__str, 0x64uLL, "\\ls%ld\\ilvl%ld", v25 + 1, [(NSArray *)v16 count] - 1);
        [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
      }
LABEL_34:
      NSRange v9 = v15;
    }
    else
    {
      NSRange v9 = v15;
      uint64_t v3 = v100;
    }
    double v12 = v104;
    uint64_t v7 = v108;
LABEL_36:
    if (!v103)
    {
      if ([v12 objectForKey:@"NSLink"])
      {
        *(void *)__str = 0;
        uint64_t v118 = 0;
        unsigned int v29 = -[NSRTFWriter writeLinkInfo:]((CFDataRef)v1, (const __CFURL *)objc_msgSend(*(id *)(v1 + 16), "attribute:atIndex:longestEffectiveRange:inRange:", @"NSLink", v115, __str, 0, *(void *)(v1 + 24)));
        uint64_t v30 = v118 + *(void *)__str;
        uint64_t v31 = v102;
        if (v29) {
          uint64_t v31 = v7;
        }
        v102 = v31;
        if (!v29) {
          uint64_t v30 = 0;
        }
        uint64_t v103 = v30;
      }
      else
      {
        uint64_t v103 = 0;
      }
    }
    -[NSRTFWriter writeCharacterAttributes:previousAttributes:](v1, v12, v7);
    uint64_t v32 = -[NSRTFWriter textFlowWithAttributes:range:](v1, v12, &v115);
    if (v32 != v99)
    {
      uint64_t v33 = v32;
      -[NSRTFWriter writeTextFlow:](v1, v32);
      uint64_t v99 = v33;
    }
    v34 = (void *)[v12 objectForKey:NSGlyphInfoAttributeName];
    if (v34)
    {
      [*(id *)(v1 + 8) appendBytes:"{" length:1];
      -[NSRTFWriter writeGlyphInfo:](v1, v34);
    }
    v101 = v34;
    uint64_t v35 = v111;
    unint64_t v36 = *((void *)&v112 + 1) + v111 - 1;
    uint64_t v37 = 1 - (*((void *)&v112 + 1) + v111);
    if (v116)
    {
      unint64_t v38 = 0;
      int v39 = (unsigned __int16)v114;
      v109 = v9;
      while (1)
      {
        switch(v39)
        {
          case 9:
            if (v107)
            {
              writeCharacters(*(void *)(v1 + 8), v3, v36, v38 + v37 + v115 + 1, 1u);
              unint64_t v36 = v111 + *((void *)&v112 + 1);
              [*(id *)(v1 + 8) appendBytes:"}" length:1];
LABEL_103:
              char v107 = 0;
              goto LABEL_104;
            }
            if ((v10 & 1) == 0
              || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "objectForKey:", @"NSParagraphStyle"), "textLists"), "count"))
            {
              goto LABEL_103;
            }
            uint64_t v59 = *((void *)&v112 + 1);
            uint64_t v60 = v111;
            if ((unint64_t)v111 < v110)
            {
              unint64_t v61 = v111 + 1;
              *(void *)&long long v111 = v111 + 1;
              __int16 v62 = *((_WORD *)v113 + v60);
LABEL_122:
              LOWORD(v114) = v62;
              goto LABEL_123;
            }
            unint64_t v71 = v110 + *((void *)&v112 + 1);
            if ((unint64_t)v112 <= v110 + *((void *)&v112 + 1))
            {
              unint64_t v61 = v110 + 1;
              *(void *)&long long v111 = v110 + 1;
              __int16 v62 = -1;
              goto LABEL_122;
            }
            unint64_t v72 = v38;
            if ((unint64_t)v112 - (v110 + *((void *)&v112 + 1)) >= 0x20) {
              uint64_t v73 = 32;
            }
            else {
              uint64_t v73 = v112 - (v110 + *((void *)&v112 + 1));
            }
            *((void *)&v112 + 1) += v110;
            unint64_t v110 = v73;
            v74 = (void *)*((void *)&v111 + 1);
            Uid = sel_getUid("getCharacters:range:");
            v76 = v74;
            NSRange v9 = v109;
            uint64_t v77 = v73;
            unint64_t v38 = v72;
            objc_msgSend(v76, Uid, v113, v71, v77);
            __int16 v62 = v113[0];
            LOWORD(v114) = v113[0];
            *(void *)&long long v111 = 1;
            unint64_t v61 = 1;
LABEL_123:
            unint64_t v106 = v60 + v59;
            unint64_t v78 = v60 + v59 - 1;
            while (1)
            {
              unint64_t v79 = v110;
              if (v61 - 1 >= v110) {
                break;
              }
              unint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
              switch(v62)
              {
                case 9:
                  unint64_t v80 = *((void *)&v112 + 1) + v61 - 1;
                  goto LABEL_131;
                case 10:
                case 12:
                  goto LABEL_143;
                case 11:
                  goto LABEL_131;
                case 13:
                  unint64_t v81 = *((void *)&v112 + 1) + v61;
                  if (v81 >= [(__CFString *)v3 length]
                    || [(__CFString *)v3 characterAtIndex:v81] != 10)
                  {
                    goto LABEL_143;
                  }
                  unint64_t v79 = v110;
                  unint64_t v61 = v111;
LABEL_131:
                  if (v61 < v79)
                  {
                    v82 = (char *)&v110 + 2 * v61++;
                    *(void *)&long long v111 = v61;
                    __int16 v62 = *((_WORD *)v82 + 20);
LABEL_139:
                    LOWORD(v114) = v62;
                    goto LABEL_140;
                  }
                  unint64_t v83 = *((void *)&v112 + 1) + v79;
                  if ((unint64_t)v112 <= *((void *)&v112 + 1) + v79)
                  {
                    unint64_t v61 = v79 + 1;
                    *(void *)&long long v111 = v79 + 1;
                    __int16 v62 = -1;
                    goto LABEL_139;
                  }
                  unint64_t v84 = v38;
                  if ((unint64_t)v112 - (*((void *)&v112 + 1) + v79) >= 0x20) {
                    uint64_t v85 = 32;
                  }
                  else {
                    uint64_t v85 = v112 - (*((void *)&v112 + 1) + v79);
                  }
                  *((void *)&v112 + 1) += v79;
                  unint64_t v110 = v85;
                  v86 = (void *)*((void *)&v111 + 1);
                  v87 = sel_getUid("getCharacters:range:");
                  v88 = v86;
                  NSRange v9 = v109;
                  uint64_t v89 = v85;
                  unint64_t v38 = v84;
                  objc_msgSend(v88, v87, v113, v83, v89);
                  __int16 v62 = v113[0];
                  LOWORD(v114) = v113[0];
                  *(void *)&long long v111 = 1;
                  unint64_t v61 = 1;
LABEL_140:
                  if (v80 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_143;
                  }
                  break;
                default:
                  if (DWORD2(v112) != 8233) {
                    goto LABEL_131;
                  }
                  goto LABEL_143;
              }
            }
            unint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_143:
            uint64_t v90 = *((void *)&v112 + 1);
            if (*((void *)&v112 + 1) > v78 || v110 + *((void *)&v112 + 1) <= v78)
            {
              if (v78 > 0xF)
              {
                uint64_t v93 = v112;
                unint64_t v91 = v38;
                if ((uint64_t)v112 - 16 >= v78)
                {
                  unint64_t v92 = v106 - 17;
                }
                else if ((unint64_t)v112 >= 0x20)
                {
                  unint64_t v92 = v112 - 32;
                }
                else
                {
                  unint64_t v92 = 0;
                }
                *((void *)&v112 + 1) = v92;
              }
              else
              {
                unint64_t v91 = v38;
                unint64_t v92 = 0;
                *((void *)&v112 + 1) = 0;
                uint64_t v93 = v112;
              }
              unint64_t v94 = v93 - v92;
              if (v94 >= 0x20) {
                uint64_t v95 = 32;
              }
              else {
                uint64_t v95 = v94;
              }
              unint64_t v110 = v95;
              objc_msgSend(*((id *)&v111 + 1), sel_getUid("getCharacters:range:"), v113, v92, v95);
              LOWORD(v114) = v113[0];
              uint64_t v90 = *((void *)&v112 + 1);
              NSRange v9 = v109;
              unint64_t v38 = v91;
            }
            char v107 = 0;
            uint64_t v96 = v78 - v90;
            *(void *)&long long v111 = v96 + 1;
            LOWORD(v114) = *((_WORD *)v113 + v96);
            if (v78 == 0x7FFFFFFFFFFFFFFFLL || v80 == 0x7FFFFFFFFFFFFFFFLL || v80 <= v106)
            {
              char v10 = 0;
            }
            else
            {
              [*(id *)(v1 + 8) appendBytes:"{\\listtext" length:10];
              char v10 = 0;
              char v107 = 1;
            }
LABEL_105:
            uint64_t v63 = v111;
            if ((unint64_t)v111 >= v110)
            {
              unint64_t v64 = *((void *)&v112 + 1) + v110;
              if ((unint64_t)v112 > *((void *)&v112 + 1) + v110)
              {
                unint64_t v65 = v38;
                if ((unint64_t)v112 - (*((void *)&v112 + 1) + v110) >= 0x20) {
                  uint64_t v66 = 32;
                }
                else {
                  uint64_t v66 = v112 - (*((void *)&v112 + 1) + v110);
                }
                *((void *)&v112 + 1) += v110;
                unint64_t v110 = v66;
                v67 = (void *)*((void *)&v111 + 1);
                v68 = sel_getUid("getCharacters:range:");
                v69 = v67;
                NSRange v9 = v109;
                uint64_t v70 = v66;
                unint64_t v38 = v65;
                objc_msgSend(v69, v68, v113, v64, v70);
                int v39 = LOWORD(v113[0]);
                LOWORD(v114) = v113[0];
                *(void *)&long long v111 = 1;
                uint64_t v35 = 1;
                goto LABEL_114;
              }
              uint64_t v35 = v110 + 1;
              *(void *)&long long v111 = v110 + 1;
              int v39 = 0xFFFF;
            }
            else
            {
              uint64_t v35 = v111 + 1;
              *(void *)&long long v111 = v111 + 1;
              int v39 = *((unsigned __int16 *)v113 + v63);
            }
            LOWORD(v114) = v39;
LABEL_114:
            ++v38;
            uint64_t v37 = -(uint64_t)v36;
            if (v38 >= v116) {
              goto LABEL_163;
            }
            break;
          case 10:
          case 12:
            goto LABEL_63;
          case 11:
            goto LABEL_58;
          case 13:
            unint64_t v41 = v35 + *((void *)&v112 + 1);
            if (v41 < [(__CFString *)v3 length]
              && [(__CFString *)v3 characterAtIndex:v41] == 10)
            {
              goto LABEL_58;
            }
            goto LABEL_63;
          default:
            if (v39 == 8233)
            {
LABEL_63:
              uint64_t v44 = objc_msgSend((id)objc_msgSend(v104, "objectForKey:", @"NSWritingDirection"), "count");
              unint64_t v105 = v38;
              writeCharacters(*(void *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
              while (v44)
              {
                --v44;
                *(_WORD *)__str = 8236;
                writeCharacters(*(void *)(v1 + 8), (const __CFString *)[NSString stringWithCharacters:__str length:1], 0, 1, *(_DWORD *)(v1 + 148));
              }
              if (v107) {
                [*(id *)(v1 + 8) appendBytes:"}" length:1];
              }
              unint64_t v36 = v111 + *((void *)&v112 + 1);
              if (v9 && (uint64_t v45 = [(NSArray *)v9 count]) != 0)
              {
                unint64_t v46 = v45;
                BOOL v47 = v103 != 0;
                if (v36 < *(void *)(v1 + 24)
                  && (v48 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v36, 0), "textBlocks"), unint64_t v49 = objc_msgSend(v48, "count"), v48))
                {
                  unint64_t v50 = 0;
                  if (v46 >= v49) {
                    unint64_t v51 = v49;
                  }
                  else {
                    unint64_t v51 = v46;
                  }
                  if (v51)
                  {
                    do
                    {
                      uint64_t v52 = [v48 objectAtIndex:v50];
                      if ((id)v52 != [(NSArray *)v109 objectAtIndex:v50]) {
                        goto LABEL_78;
                      }
                      ++v50;
                    }
                    while (v51 != v50);
                    unint64_t v50 = v51;
                  }
LABEL_78:
                  uint64_t v3 = v100;
                }
                else
                {
                  unint64_t v50 = 0;
                }
                int v55 = 0;
                unint64_t v56 = v46 - 1;
                do
                {
                  if (v56 >= v50)
                  {
                    if (v47) {
                      [*(id *)(v1 + 8) appendBytes:"}}" length:2];
                    }
                    BOOL v47 = 0;
                    v55 |= -[NSRTFWriter writeCellTerminator:atIndex:nestingLevel:](v1, [(NSArray *)v109 objectAtIndex:v56], v36 - 1, v56);
                  }
                  v8 |= *(void *)(v1 + 24) == v36;
                  --v56;
                }
                while (v56 != -1);
                v57 = "\\\n";
                if (v55) {
                  v57 = "\n";
                }
                if (v39 == 12) {
                  v58 = "\\page\n";
                }
                else {
                  v58 = v57;
                }
                [*(id *)(v1 + 8) appendBytes:v58 length:strlen(v58)];
                if (v103 != 0 && !v47)
                {
                  -[NSRTFWriter restoreAttributes:](v1, v102);
                  uint64_t v103 = 0;
                }
                char v107 = 0;
                char v10 = 1;
                NSRange v9 = v109;
              }
              else
              {
                if (v39 == 12)
                {
                  v53 = "\\page ";
                  uint64_t v54 = 6;
                }
                else
                {
                  v53 = "\\\n";
                  uint64_t v54 = 2;
                }
                [*(id *)(v1 + 8) appendBytes:v53 length:v54];
                char v107 = 0;
                char v10 = 1;
              }
              unint64_t v38 = v105;
              goto LABEL_105;
            }
            if (v39 == 65532)
            {
              writeCharacters(*(void *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
              long long v40 = (void *)[v104 objectForKey:@"NSAttachment"];
              [v104 objectForKey:NSAttachmentEditableDataAttributeName];
              [v104 objectForKey:NSAttachmentEditableDataTypeIdentifierAttributeName];
              -[NSRTFWriter writeAttachment:editableData:editableTypeIdentifier:](v1, v40);
              -[NSRTFWriter writeImageGlyph:attributes:](v1, (void *)[v104 objectForKeyedSubscript:@"CTAdaptiveImageProvider"], (uint64_t)v104);
              unint64_t v36 = v111 + *((void *)&v112 + 1);
              goto LABEL_105;
            }
LABEL_58:
            if (v10)
            {
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "objectForKey:", @"NSParagraphStyle"), "textLists"), "count"))
              {
                double v42 = (__CFString *)-[NSRTFWriter _markerStringAtCharacterIndex:](v1, v36);
                if ([(__CFString *)v42 length])
                {
                  -[__CFString rangeOfString:options:range:](v3, "rangeOfString:options:range:", v42, 10, v36, [(__CFString *)v3 length] - v36);
                  if (!v43)
                  {
                    [*(id *)(v1 + 8) appendBytes:"{\\listtext" length:10];
                    writeCharacters(*(void *)(v1 + 8), v42, 0, [(__CFString *)v42 length], *(_DWORD *)(v1 + 148));
                    [*(id *)(v1 + 8) appendBytes:"}" length:1];
                  }
                }
              }
            }
LABEL_104:
            char v10 = 0;
            goto LABEL_105;
        }
      }
    }
    unint64_t v38 = 0;
LABEL_163:
    writeCharacters(*(void *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
    if (v101) {
      [*(id *)(v1 + 8) appendBytes:"}" length:1];
    }
    NSUInteger v5 = v115 + v116;
    NSUInteger v115 = v5;
    uint64_t result = (id *)v104;
    if (v103 == v5)
    {
      [*(id *)(v1 + 8) appendBytes:"}}" length:2];
      -[NSRTFWriter restoreAttributes:](v1, v102);
      uint64_t v103 = 0;
      NSUInteger v5 = v115;
      uint64_t result = v102;
    }
    uint64_t v7 = result;
  }
  while (v5 < *(void *)(v1 + 24));
  if (result)
  {
    uint64_t result = (id *)objc_msgSend((id)objc_msgSend(result, "objectForKey:", @"NSWritingDirection"), "count");
    if (result)
    {
      v97 = result;
      do
      {
        v97 = (id *)((char *)v97 - 1);
        *(_WORD *)__str = 8236;
        uint64_t result = (id *)writeCharacters(*(void *)(v1 + 8), (const __CFString *)[NSString stringWithCharacters:__str length:1], 0, 1, *(_DWORD *)(v1 + 148));
      }
      while (v97);
    }
  }
  if (!(v8 & 1 | (v9 == 0)))
  {
    uint64_t result = [(NSArray *)v9 count];
    if (result)
    {
      unint64_t v98 = (unint64_t)result - 1;
      do
      {
        uint64_t result = (id *)-[NSRTFWriter writeCellTerminator:atIndex:nestingLevel:](v1, [(NSArray *)v9 objectAtIndex:v98], *(void *)(v1 + 24) - 1, v98);
        --v98;
      }
      while (v98 != -1);
    }
  }
  return result;
}

- (BOOL)_canWriteColor:(BOOL)result
{
  if (result)
  {
    getUIColorClass_1[0]();
    if (objc_opt_isKindOfClass())
    {
      ColorSpace = CGColorGetColorSpace((CGColorRef)[a2 CGColor]);
      return CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_addColor:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t result = -[NSRTFWriter _canWriteColor:](result, a2);
      if (result)
      {
        uint64_t result = [*(id *)(v3 + 56) objectForKeyedSubscript:a2];
        if (!result)
        {
          uint64_t v4 = [*(id *)(v3 + 64) count];
          objc_msgSend(*(id *)(v3 + 56), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v4), a2);
          NSUInteger v5 = *(void **)(v3 + 64);
          return [v5 addObject:a2];
        }
      }
    }
  }
  return result;
}

- (__CFString)_plainFontNameForFont:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return &stru_1EDD49F70;
  }
  if (_plainFontNameForFont__tigerCompatibility == 255)
  {
    int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSRTFWriterTigerCompatibility");
    _plainFontNameForFont__tigerCompatibility = v5;
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (!_plainFontNameForFont__tigerCompatibility)
  {
LABEL_10:
    os_unfair_lock_lock_with_options();
    if (!_plainFontNameForFont__fontToPlainNameTable)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
LABEL_14:
      UIFontDescriptorSymbolicTraits v6 = [(UIFontDescriptor *)[(UIFont *)a2 fontDescriptor] symbolicTraits];
      uint64_t v7 = a2;
      if ((v6 & 0xFFFFFFC) == 0)
      {
        uint64_t v7 = a2;
        if ((v6 & 3) != 0)
        {
          uint64_t v8 = [(UIFontDescriptor *)[(UIFont *)a2 fontDescriptor] fontDescriptorWithSymbolicTraits:v6 & 0xFFFFFFFC];
          [(UIFont *)a2 pointSize];
          NSRange v9 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8);
          uint64_t v10 = [(UIFontDescriptor *)[(UIFont *)v9 fontDescriptor] fontDescriptorWithSymbolicTraits:[(UIFontDescriptor *)[(UIFont *)v9 fontDescriptor] symbolicTraits] | 3];
          [(UIFont *)v9 pointSize];
          if ([(UIFont *)v9 isEqual:+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v10)])uint64_t v7 = v9; {
          else
          }
            uint64_t v7 = a2;
        }
      }
      uint64_t v4 = [(UIFont *)v7 fontName];
      if ([(NSString *)v4 isEqualToString:@"LastResort"])
      {
        CFTypeRef v11 = (UIFont *)NSDefaultFont();
      }
      else if ([(NSString *)v4 isEqualToString:@"AquaKana"])
      {
        CFTypeRef v11 = +[UIFont systemFontOfSize:0.0];
      }
      else
      {
        if (![(NSString *)v4 isEqualToString:@"AquaKana-Bold"])
        {
LABEL_26:
          os_unfair_lock_lock_with_options();
          double v12 = (NSMapTable *)_plainFontNameForFont__fontToPlainNameTable;
          if (!_plainFontNameForFont__fontToPlainNameTable)
          {
            long long v13 = *(_OWORD *)(MEMORY[0x1E4F28780] + 16);
            *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x1E4F28780];
            *(_OWORD *)&keyCallBacks.retain = v13;
            *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x1E4F28780] + 32);
            NSMapTableValueCallBacks v14 = *(NSMapTableValueCallBacks *)*(void *)&MEMORY[0x1E4F28788];
            double v12 = NSCreateMapTableWithZone(&keyCallBacks, &v14, 0x14uLL, 0);
            _plainFontNameForFont__fontToPlainNameTable = (uint64_t)v12;
          }
          NSMapInsert(v12, a2, v4);
          os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
          return (__CFString *)v4;
        }
        CFTypeRef v11 = +[UIFont boldSystemFontOfSize:0.0];
      }
      uint64_t v4 = [(UIFont *)v11 fontName];
      goto LABEL_26;
    }
    uint64_t v4 = (NSString *)NSMapGet((NSMapTable *)_plainFontNameForFont__fontToPlainNameTable, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
    if (!v4) {
      goto LABEL_14;
    }
    return (__CFString *)v4;
  }
LABEL_5:

  return (__CFString *)[(UIFont *)a2 fontName];
}

- (uint64_t)writeFontTable
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 40) count];
    uint64_t v3 = (void *)[*(id *)(v1 + 40) keyEnumerator];
    uint64_t v38 = (uint64_t)&v38;
    double v16 = MEMORY[0x1F4188790](v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v18 = (char *)&v38 - v17;
    objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\fonttbl", 9, v16);
    if (v2) {
      bzero(v18, 8 * v2);
    }
    uint64_t v19 = [v3 nextObject];
    if (v19)
    {
      uint64_t v20 = v19;
      do
      {
        *(void *)&v18[8
                      * objc_msgSend((id)objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v20), "unsignedIntegerValue")] = v20;
        uint64_t v20 = [v3 nextObject];
      }
      while (v20);
    }
    if (v2)
    {
      unint64_t v21 = 0;
      uint64_t v40 = v2;
      int v39 = v18;
      do
      {
        v22 = *(__CFString **)&v18[8 * v21];
        id v23 = +[UIFont _fontWithName:v22 size:12.0];
        if (!v23) {
          id v23 = (id)[*(id *)(v1 + 48) objectForKey:v22];
        }
        snprintf(__str, 0x64uLL, "\\f%ld\\f", v21);
        [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
        uint64_t v24 = [v23 familyName];
        if (v24)
        {
          uint64_t v25 = (const void *)v24;
          os_unfair_lock_lock_with_options();
          unint64_t v26 = (NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable;
          if (!rtfFontFamilyForFontFamily_fontMapTable)
          {
            long long v27 = *(_OWORD *)(MEMORY[0x1E4F28780] + 16);
            *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x1E4F28780];
            *(_OWORD *)&keyCallBacks.retain = v27;
            *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x1E4F28780] + 32);
            NSMapTableValueCallBacks valueCallBacks = *(NSMapTableValueCallBacks *)*(void *)&MEMORY[0x1E4F28480];
            rtfFontFamilyForFontFamily_fontMapTable = (uint64_t)NSCreateMapTableWithZone(&keyCallBacks, &valueCallBacks, 5uLL, 0);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, @"Times-Roman", (const void *)1);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, @"Helvetica", (const void *)2);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, @"Courier", (const void *)3);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, @"Symbol", (const void *)6);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, @"Ohlfs", (const void *)3);
            unint64_t v26 = (NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable;
          }
          v28 = NSMapGet(v26, v25);
          if (!v28)
          {
            if (rtfFontFamilyForFontFamily_loadedExternalFile)
            {
              v28 = 0;
            }
            else
            {
              os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
              uint64_t v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"NSRTFFontFamilyMappings", @"plist");
              unint64_t v41 = v25;
              if (v29) {
                uint64_t v30 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v29];
              }
              else {
                uint64_t v30 = 0;
              }
              os_unfair_lock_lock_with_options();
              if ((rtfFontFamilyForFontFamily_loadedExternalFile & 1) == 0)
              {
                rtfFontFamilyForFontFamily_loadedExternalFile = 1;
                if (v30)
                {
                  for (uint64_t i = 1; i != 8; ++i)
                  {
                    uint64_t v32 = (void *)[v30 objectForKey:rtfFontFamilyNames[i]];
                    uint64_t v33 = [v32 count];
                    if (v33)
                    {
                      uint64_t v34 = v33 - 1;
                      do
                        NSMapInsert((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, (const void *)[v32 objectAtIndex:v34--], (const void *)i);
                      while (v34 != -1);
                    }
                  }
                }
              }

              v28 = NSMapGet((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, v41);
              uint64_t v2 = v40;
              uint64_t v18 = v39;
            }
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
        }
        else
        {
          v28 = 0;
        }
        -[NSRTFWriter writeEscapedUTF8String:](v1, rtfFontFamilyNames[(void)v28]);
        int v35 = -[NSRTFWriter _mostCompatibleCharset:](v1, v23);
        snprintf(__str, 0x64uLL, "\\fcharset%d ", v35);
        [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
        writeCharacters(*(void *)(v1 + 8), v22, 0, [(__CFString *)v22 length], *(_DWORD *)(v1 + 148));
        if (v21 % 3 == 2) {
          unint64_t v36 = ";\n";
        }
        else {
          unint64_t v36 = ";";
        }
        if (v21 % 3 == 2) {
          uint64_t v37 = 2;
        }
        else {
          uint64_t v37 = 1;
        }
        [*(id *)(v1 + 8) appendBytes:v36 length:v37];
        ++v21;
      }
      while (v21 != v2);
    }
    return [*(id *)(v1 + 8) appendBytes:"}\n" length:2];
  }
  return result;
}

- (unint64_t)writeColorTable
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v1 = result;
    uint64_t result = [*(id *)(result + 56) count];
    if (result >= 2)
    {
      unint64_t v2 = result;
      [*(id *)(v1 + 8) appendBytes:"{\\colortbl;" length:11];
      for (unint64_t i = 1; i != v2; ++i)
      {
        uint64_t v4 = (void *)RGBColorForColor((void *)[*(id *)(v1 + 64) objectAtIndexedSubscript:i]);
        if (v4)
        {
          double v44 = 0.0;
          *(double *)uint64_t v45 = 0.0;
          double v43 = 0.0;
          [v4 getRed:v45 green:&v44 blue:&v43 alpha:0];
          double v5 = *(double *)v45;
          if (*(double *)v45 >= 0.0)
          {
            if (*(double *)v45 > 1.0)
            {
              *(double *)uint64_t v45 = 1.0;
              double v5 = 1.0;
            }
          }
          else
          {
            *(double *)uint64_t v45 = 0.0;
            double v5 = 0.0;
          }
          double v6 = v44;
          if (v44 >= 0.0)
          {
            if (v44 > 1.0)
            {
              double v44 = 1.0;
              double v6 = 1.0;
            }
          }
          else
          {
            double v44 = 0.0;
            double v6 = 0.0;
          }
          double v7 = v43;
          if (v43 >= 0.0)
          {
            if (v43 > 1.0)
            {
              double v43 = 1.0;
              double v7 = 1.0;
            }
          }
          else
          {
            double v43 = 0.0;
            double v7 = 0.0;
          }
          snprintf(__str, 0xC8uLL, "\\red%d\\green%d\\blue%d", (int)(v5 * 255.0 + 0.5), (int)(v6 * 255.0 + 0.5), (int)(v7 * 255.0 + 0.5));
          [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
        }
        if (i + -3 - 5 * (i / 5) == 1) {
          uint64_t v8 = ";\n";
        }
        else {
          uint64_t v8 = ";";
        }
        if (i + -3 - 5 * (i / 5) == 1) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 1;
        }
        [*(id *)(v1 + 8) appendBytes:v8 length:v9];
      }
      [*(id *)(v1 + 8) appendBytes:"}\n{\\*\\expandedcolortbl;;" length:24];
      if (v2 >= 3)
      {
        CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F1DBF0];
        CFTypeRef v38 = (CFTypeRef)*MEMORY[0x1E4F1DC00];
        CFStringRef v39 = (const __CFString *)*MEMORY[0x1E4F1DBB8];
        CFStringRef cf2 = (const __CFString *)*MEMORY[0x1E4F1DB90];
        CFTypeRef v37 = (CFTypeRef)*MEMORY[0x1E4F1DC98];
        CFTypeRef v36 = (CFTypeRef)*MEMORY[0x1E4F1DBE8];
        unint64_t v10 = 2;
        CFTypeRef v35 = (CFTypeRef)*MEMORY[0x1E4F1DC10];
        CFTypeRef v33 = (CFTypeRef)*MEMORY[0x1E4F1DBE0];
        CFTypeRef v34 = (CFTypeRef)*MEMORY[0x1E4F1DC88];
        while (1)
        {
          __n128 v11 = (void *)[*(id *)(v1 + 64) objectAtIndexedSubscript:v10];
          if (v11) {
            break;
          }
LABEL_94:
          if (v10 % 5 == 4) {
            uint64_t v31 = ";\n";
          }
          else {
            uint64_t v31 = ";";
          }
          if (v10 % 5 == 4) {
            uint64_t v32 = 2;
          }
          else {
            uint64_t v32 = 1;
          }
          [*(id *)(v1 + 8) appendBytes:v31 length:v32];
          if (++v10 == v2) {
            return [*(id *)(v1 + 8) appendBytes:"}\n" length:2];
          }
        }
        __n128 v12 = v11;
        __n128 v13 = (CGColor *)[v11 CGColor];
        if (!v13 || (uint64_t v14 = (uint64_t)v13, (ColorSpace = CGColorGetColorSpace(v13)) == 0))
        {
          unsigned int v20 = 0;
          goto LABEL_37;
        }
        double v16 = ColorSpace;
        CFStringRef cf1 = CGColorSpaceCopyName(ColorSpace);
        CGColorSpaceModel Model = CGColorSpaceGetModel(v16);
        if (Model)
        {
          if (Model != kCGColorSpaceModelCMYK)
          {
            CFStringRef v18 = cf1;
            if (Model != kCGColorSpaceModelRGB)
            {
              uint64_t v19 = 0;
              unsigned int v20 = 0;
              uint64_t v14 = 0;
              if (!cf1) {
                goto LABEL_70;
              }
              goto LABEL_69;
            }
            if (cf1)
            {
              if (CFEqual(cf1, cf2))
              {
                uint64_t v19 = 0;
                unsigned int v20 = 5;
LABEL_64:
                if (CGColorGetComponents((CGColorRef)v14)
                  && (size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v14), NumberOfComponents - 1 <= 4))
                {
                  uint64_t v14 = NumberOfComponents;
                  __memcpy_chk();
                }
                else
                {
                  uint64_t v14 = 0;
                }
                CFStringRef v18 = cf1;
                if (cf1) {
                  goto LABEL_69;
                }
LABEL_70:
                if (v19) {
                  CFRelease(v19);
                }
                if (v14)
                {
LABEL_73:
                  if (v20) {
                    BOOL v22 = v14 == 0;
                  }
                  else {
                    BOOL v22 = 1;
                  }
                  if (!v22)
                  {
                    uint64_t v23 = 0;
                    uint64_t v24 = &__str[snprintf(__str, 0xC8uLL, "\\cs%s", *((const char **)&rtfColorSpaceKeyword + v20))];
                    do
                    {
                      double v25 = *(double *)&v45[v23];
                      if (v14 - 1 > v23 || v25 < 1.0) {
                        v24 += snprintf(v24, (char *)&v50 - v24, "\\c%ld", llround(v25 * 100000.0));
                      }
                      ++v23;
                    }
                    while (v14 != v23);
                    [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
                  }
                  if (objc_opt_respondsToSelector())
                  {
                    unint64_t v26 = (void *)[v12 _systemColorName];
                    if (v26)
                    {
                      long long v27 = (const char *)[v26 UTF8String];
                      if (v27)
                      {
                        int v28 = *(unsigned __int8 *)v27;
                        if (*v27)
                        {
                          uint64_t v29 = (unsigned __int8 *)(v27 + 1);
                          while ((v28 & 0xDFu) - 65 < 0x1A || v28 == 95 || (v28 - 58) >= 0xFFFFFFF6)
                          {
                            int v30 = *v29++;
                            int v28 = v30;
                            if (!v30) {
                              goto LABEL_92;
                            }
                          }
                        }
                        else
                        {
LABEL_92:
                          if (snprintf(__str, 0x64uLL, "\\cname %s", v27) <= 0x63) {
                            [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_94;
                }
LABEL_37:
                if ([v12 getRed:v45 green:&v46 blue:&v47 alpha:&v48])
                {
                  unsigned int v20 = 1;
                  uint64_t v14 = 4;
                }
                else
                {
                  uint64_t v14 = 0;
                }
                goto LABEL_73;
              }
              if (CFEqual(cf1, v37) || CFEqual(cf1, v36))
              {
                uint64_t v19 = 0;
                unsigned int v20 = 1;
                goto LABEL_64;
              }
              if (CFEqual(cf1, v35))
              {
                uint64_t v19 = 0;
                unsigned int v20 = 2;
                goto LABEL_64;
              }
              if (CFEqual(cf1, v34) || CFEqual(cf1, v33))
              {
                uint64_t v19 = 0;
                unsigned int v20 = 3;
                goto LABEL_64;
              }
            }
            uint64_t v14 = newCGColorByConvertingToColorSpaceWithName(v14, cf2);
            if (v14)
            {
              unsigned int v20 = 5;
              goto LABEL_63;
            }
LABEL_102:
            uint64_t v19 = 0;
            unsigned int v20 = 0;
            if (!v18) {
              goto LABEL_70;
            }
LABEL_69:
            CFRelease(v18);
            goto LABEL_70;
          }
          CFStringRef v18 = cf1;
          if (cf1 && CFEqual(cf1, v41))
          {
            uint64_t v19 = 0;
            unsigned int v20 = 6;
            goto LABEL_64;
          }
          uint64_t v14 = newCGColorByConvertingToColorSpaceWithName(v14, v41);
          if (!v14) {
            goto LABEL_102;
          }
          unsigned int v20 = 6;
        }
        else
        {
          CFStringRef v18 = cf1;
          if (cf1 && (CFEqual(cf1, v38) || CFEqual(cf1, v39)))
          {
            uint64_t v19 = 0;
            unsigned int v20 = 4;
            goto LABEL_64;
          }
          uint64_t v14 = newCGColorByConvertingToColorSpaceWithName(v14, v39);
          if (!v14) {
            goto LABEL_102;
          }
          unsigned int v20 = 4;
        }
LABEL_63:
        uint64_t v19 = (const void *)v14;
        goto LABEL_64;
      }
      return [*(id *)(v1 + 8) appendBytes:"}\n" length:2];
    }
  }
  return result;
}

- (uint64_t)writeHighlightStyleTable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 208) count];
    if (result)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      unint64_t v2 = *(void **)(v1 + 208);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        char v4 = 0;
        uint64_t v5 = *(void *)v10;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v10 != v5) {
              objc_enumerationMutation(v2);
            }
            double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
            if ([v7 length]
              && [(NSArray *)+[NSRTFReader defaultTextHighlightStyles] indexOfObject:v7] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v4 & 1) == 0) {
                [*(id *)(v1 + 8) appendBytes:"{\\*\\AppleHighlightTable;" length:24];
              }
              uint64_t v8 = (__CFString *)[[NSString alloc] initWithFormat:@"%@;", v7];
              writeCharacters(*(void *)(v1 + 8), v8, 0, [(__CFString *)v8 length], 0x600u);

              char v4 = 1;
            }
            ++v6;
          }
          while (v3 != v6);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
        }
        while (result);
        if (v4) {
          return [*(id *)(v1 + 8) appendBytes:"}\n" length:2];
        }
      }
    }
  }
  return result;
}

- (uint64_t)writeHighlightColorSchemeTable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 216) count];
    if (result)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      unint64_t v2 = *(void **)(v1 + 216);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        char v4 = 0;
        uint64_t v5 = *(void *)v10;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v10 != v5) {
              objc_enumerationMutation(v2);
            }
            double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
            if ([v7 length]
              && [(NSArray *)+[NSRTFReader defaultTextHighlightColorSchemes] indexOfObject:v7] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v4 & 1) == 0) {
                [*(id *)(v1 + 8) appendBytes:"{\\*\\AppleHilightClrSchTbl;" length:26];
              }
              uint64_t v8 = (__CFString *)[[NSString alloc] initWithFormat:@"%@;", v7];
              writeCharacters(*(void *)(v1 + 8), v8, 0, [(__CFString *)v8 length], 0x600u);

              char v4 = 1;
            }
            ++v6;
          }
          while (v3 != v6);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
        }
        while (result);
        if (v4) {
          return [*(id *)(v1 + 8) appendBytes:"}\n" length:2];
        }
      }
    }
  }
  return result;
}

- (uint64_t)writeListTable
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t result = [*(id *)(result + 72) count];
    if (result)
    {
      uint64_t v2 = result;
      [v1[1] appendBytes:"{\\*\\listtable" length:13];
      uint64_t v3 = 0;
      int v4 = 1;
      unint64_t v35 = v2;
      do
      {
        unint64_t v5 = objc_msgSend((id)objc_msgSend(v1[9], "objectAtIndex:", v3), "rangeValue");
        uint64_t v7 = v6;
        unint64_t v39 = v5;
        uint64_t v8 = (void *)[MEMORY[0x1E4F1C978] array];
        unint64_t v36 = v3 + 1;
        snprintf(__str, 0x12CuLL, "{\\list\\listtemplateid%lu\\listhybrid", v3 + 1);
        [v1[1] appendBytes:__str length:strlen(__str)];
        unint64_t v9 = v5 + v7;
        if (v5 < v5 + v7)
        {
          do
          {
            long long v10 = objc_msgSend((id)objc_msgSend(v1[2], "attribute:atIndex:effectiveRange:", @"NSParagraphStyle"), "textLists");
            unint64_t v11 = [v10 count];
            if (v11 > [v8 count]) {
              uint64_t v8 = v10;
            }
          }
          while (v39 < v9);
        }
        uint64_t v38 = [v8 count];
        if (v38)
        {
          uint64_t v12 = 0;
          unint64_t v13 = 1;
          int v37 = v4;
          do
          {
            uint64_t v14 = (void *)[v8 objectAtIndex:v12];
            double v15 = (__CFString *)[v14 markerFormat];
            char v16 = [v14 listOptions];
            uint64_t v17 = [v14 startingItemNumber];
            uint64_t v18 = [(__CFString *)v15 length];
            [(__CFString *)v15 rangeOfString:@"{decimal}"];
            if (v19)
            {
              uint64_t v20 = 0;
            }
            else
            {
              [(__CFString *)v15 rangeOfString:@"{upper-roman}"];
              if (v21)
              {
                uint64_t v20 = 1;
              }
              else
              {
                [(__CFString *)v15 rangeOfString:@"{lower-roman}"];
                if (v22)
                {
                  uint64_t v20 = 2;
                }
                else
                {
                  [(__CFString *)v15 rangeOfString:@"{upper-alpha}"];
                  if (v23 || ([(__CFString *)v15 rangeOfString:@"{upper-latin}"], v24))
                  {
                    uint64_t v20 = 3;
                  }
                  else
                  {
                    [(__CFString *)v15 rangeOfString:@"{lower-alpha}"];
                    if (v31 || ([(__CFString *)v15 rangeOfString:@"{lower-latin}"], v32)) {
                      uint64_t v20 = 4;
                    }
                    else {
                      uint64_t v20 = 23;
                    }
                  }
                }
              }
            }
            snprintf(__str, 0x12CuLL, "{\\listlevel\\levelnfc%lu\\levelnfcn%lu\\leveljc0\\leveljcn0\\levelfollow0\\levelstartat%ld\\levelspace360\\levelindent0", v20, v20, v17);
            [v1[1] appendBytes:__str length:strlen(__str)];
            [v1[1] appendBytes:"{\\*\\levelmarker " length:16];
            if (v18) {
              writeCharacters((uint64_t)v1[1], v15, 0, v18, 0x600u);
            }
            [v1[1] appendBytes:"}" length:1];
            if (v16) {
              [v1[1] appendBytes:"\\levelprepend" length:13];
            }
            snprintf(__str, 0x12CuLL, "{\\leveltext\\leveltemplateid%d", v12 + v4 - 100 * (v13 / 0x64));
            [v1[1] appendBytes:__str length:strlen(__str)];
            if ([v14 isOrdered])
            {
              double v25 = (__CFString *)[v14 _markerPrefix];
              unint64_t v26 = (__CFString *)[v14 _markerSuffix];
              uint64_t v27 = [(__CFString *)v25 length];
              uint64_t v28 = [(__CFString *)v26 length];
              snprintf(__str, 0x12CuLL, "\\'%02x", v27 + 1 + v28);
              [v1[1] appendBytes:__str length:strlen(__str)];
              if (v27) {
                writeCharacters((uint64_t)v1[1], v25, 0, v27, 0x600u);
              }
              snprintf(__str, 0x12CuLL, "\\'%02x", v12);
              [v1[1] appendBytes:__str length:strlen(__str)];
              if (v28) {
                writeCharacters((uint64_t)v1[1], v26, 0, v28, 0x600u);
              }
              snprintf(__str, 0x12CuLL, ";}{\\levelnumbers\\'%02x;}", v27 + 1);
              [v1[1] appendBytes:__str length:strlen(__str)];
              int v4 = v37;
            }
            else
            {
              uint64_t v29 = (__CFString *)[v14 markerForItemNumber:1];
              uint64_t v30 = [(__CFString *)v29 length];
              snprintf(__str, 0x12CuLL, "\\'%02x", v30);
              [v1[1] appendBytes:__str length:strlen(__str)];
              if (v30) {
                writeCharacters((uint64_t)v1[1], v29, 0, v30, 0x600u);
              }
              [v1[1] appendBytes:";}{\\levelnumbers;}" length:18];
            }
            unint64_t v34 = vcvtmd_s64_f64((double)(unint64_t)++v12 * 36.0 * 20.0 + 0.01);
            snprintf(__str, 0x12CuLL, "\\fi-360\\li%ld\\lin%ld }", v34, v34);
            [v1[1] appendBytes:__str length:strlen(__str)];
            ++v13;
          }
          while (v38 != v12);
        }
        uint64_t v3 = v36;
        snprintf(__str, 0x12CuLL, "{\\listname ;}\\listid%lu}", v36);
        [v1[1] appendBytes:__str length:strlen(__str)];
        if (v36 < v35) {
          [v1[1] appendBytes:"\n" length:1];
        }
        v4 += 100;
      }
      while (v36 != v35);
      [v1[1] appendBytes:"}\n{\\*\\listoverridetable" length:23];
      uint64_t v33 = 0;
      do
      {
        ++v33;
        snprintf(__str, 0x12CuLL, "{\\listoverride\\listid%lu\\listoverridecount0\\ls%lu}", v33, v33);
        [v1[1] appendBytes:__str length:strlen(__str)];
      }
      while (v35 != v33);
      return [v1[1] appendBytes:"}\n" length:2];
    }
  }
  return result;
}

- (uint64_t)writePaperSize
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[*(id *)(result + 168) objectForKey:@"PaperSize"];
    if (v2)
    {
      [v2 sizeValue];
      double v4 = v3;
      double v6 = v5;
    }
    else
    {
      double v6 = 792.0;
      double v4 = 612.0;
    }
    uint64_t v7 = (void *)[*(id *)(v1 + 168) objectForKey:@"ViewSize"];
    uint64_t v8 = (NSSize *)MEMORY[0x1E4F28AE0];
    if (v7)
    {
      [v7 sizeValue];
      double v10 = v9;
      double v12 = v11;
    }
    else
    {
      double v10 = *MEMORY[0x1E4F28AE0];
      double v12 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
    }
    unint64_t v13 = (void *)[*(id *)(v1 + 168) objectForKey:@"LeftMargin"];
    double v14 = 90.0;
    double v15 = 90.0;
    if (v13)
    {
      [v13 doubleValue];
      double v15 = v16;
    }
    uint64_t v17 = (void *)[*(id *)(v1 + 168) objectForKey:@"RightMargin"];
    if (v17)
    {
      [v17 doubleValue];
      double v14 = v18;
    }
    uint64_t v19 = (void *)[*(id *)(v1 + 168) objectForKey:@"BottomMargin"];
    if (v19)
    {
      [v19 doubleValue];
      double v21 = v20;
    }
    else
    {
      double v21 = 72.0;
    }
    uint64_t v22 = (void *)[*(id *)(v1 + 168) objectForKey:@"TopMargin"];
    if (v22)
    {
      [v22 doubleValue];
      double v24 = v23;
    }
    else
    {
      double v24 = 72.0;
    }
    double v25 = (void *)[*(id *)(v1 + 168) objectForKey:@"ViewZoom"];
    if (v25)
    {
      [v25 doubleValue];
      uint64_t v27 = (uint64_t)v26;
    }
    else
    {
      uint64_t v27 = -1;
    }
    uint64_t v28 = (void *)[*(id *)(v1 + 168) objectForKey:@"ViewMode"];
    if (v28) {
      uint64_t v29 = [v28 integerValue];
    }
    else {
      uint64_t v29 = -1;
    }
    __str[0] = 0;
    uint64_t v30 = __str;
    if (v4 != 612.0 || v6 != 792.0)
    {
      snprintf(__str, 0xC8uLL, "\\paperw%ld\\paperh%ld", vcvtmd_s64_f64(v4 * 20.0 + 0.01), vcvtmd_s64_f64(v6 * 20.0 + 0.01));
      uint64_t v30 = &__str[strlen(__str)];
    }
    if (v15 != 90.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margl%ld", vcvtmd_s64_f64(v15 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v14 != 90.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margr%ld", vcvtmd_s64_f64(v14 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v21 != 72.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margb%ld", vcvtmd_s64_f64(v21 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v24 != 72.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margt%ld", vcvtmd_s64_f64(v24 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    v33.width = v10;
    v33.height = v12;
    uint64_t result = NSEqualSizes(v33, *v8);
    if ((result & 1) == 0)
    {
      snprintf(v30, __str - v30 + 200, "\\vieww%ld\\viewh%ld", vcvtmd_s64_f64(v10 * 20.0 + 0.01), vcvtmd_s64_f64(v12 * 20.0 + 0.01));
      uint64_t result = strlen(v30);
      v30 += result;
    }
    if ((v29 & 0x8000000000000000) == 0)
    {
      snprintf(v30, __str - v30 + 200, "\\viewkind%ld", v29);
      uint64_t result = strlen(v30);
      v30 += result;
    }
    if (v27 >= 1) {
      uint64_t result = snprintf(v30, __str - v30 + 200, "\\viewscale%ld", v27);
    }
    if (__str[0])
    {
      [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
      return [*(id *)(v1 + 8) appendBytes:"\n" length:1];
    }
  }
  return result;
}

- (id)writeHyphenation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (id *)[result[21] objectForKey:@"HyphenationFactor"];
    if (result)
    {
      uint64_t result = (id *)[result doubleValue];
      if (v2 > 0.0)
      {
        __str[0] = 0;
        snprintf(__str, 0xC8uLL, "\\hyphauto1\\hyphfactor%ld\n", (uint64_t)(v2 * 100.0 + 0.5));
        return (id *)[v1[1] appendBytes:__str length:strlen(__str)];
      }
    }
  }
  return result;
}

- (id)writeDefaultTabInterval
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    double v2 = (void *)[result[21] objectForKey:@"DefaultTabInterval"];
    if (v2)
    {
      uint64_t result = (id *)[v2 doubleValue];
      goto LABEL_4;
    }
    uint64_t result = (id *)[v1[2] length];
    if (result)
    {
      uint64_t result = (id *)[v1[2] attribute:@"NSParagraphStyle" atIndex:0 effectiveRange:0];
      if (result)
      {
        uint64_t result = (id *)[result defaultTabInterval];
LABEL_4:
        if (v3 > 0.0)
        {
          __str[0] = 0;
          snprintf(__str, 0xC8uLL, "\\deftab%ld\n", vcvtmd_s64_f64(v3 * 20.0 + 0.01));
          return (id *)[v1[1] appendBytes:__str length:strlen(__str)];
        }
      }
    }
  }
  return result;
}

- (id)writeBackgroundColor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (id *)[result[21] objectForKey:@"BackgroundColor"];
    if (result)
    {
      uint64_t result = (id *)RGBColorForColor(result);
      if (result)
      {
        double v5 = 0.0;
        double v6 = 0.0;
        uint64_t v3 = 0;
        double v4 = 0.0;
        __str[0] = 0;
        uint64_t result = (id *)[result getRed:&v6 green:&v5 blue:&v4 alpha:&v3];
        unsigned int v2 = (vcvtmd_s64_f64(v5 * 255.0 + 0.5) << 8) | (vcvtmd_s64_f64(v4 * 255.0 + 0.5) << 16) | vcvtmd_s64_f64(v6 * 255.0 + 0.5);
        if (v2 != 0xFFFFFF)
        {
          snprintf(__str, 0x1F4uLL, "{\\*\\background {\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbymargin\\shpwr0\\shpwrk0\\shpfblwtxt1\\shpz0\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv %d}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn bWMode}{\\sv 9}}{\\sp{\\sn fBackground}{\\sv 1}}}}}\n", v2);
          return (id *)[v1[1] appendBytes:__str length:strlen(__str)];
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setTextScalingConversionTarget:(uint64_t)result
{
  if (result) {
    *(void *)(result + 200) = a2;
  }
  return result;
}

- (uint64_t)_setTextScalingConversionSource:(uint64_t)result
{
  if (result) {
    *(void *)(result + 192) = a2;
  }
  return result;
}

+ (double)cocoaVersion
{
  if (cocoaVersion_onceToken != -1) {
    dispatch_once(&cocoaVersion_onceToken, &__block_literal_global_40);
  }
  return *(double *)&cocoaVersion_cocoaVersion;
}

double __27__NSRTFWriter_cocoaVersion__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "valueForKey:", @"_NSRTFWriterCocoaVersion");
  if (v0)
  {
    [v0 doubleValue];
    cocoaVersion_cocoaVersion = *(void *)&result;
  }
  else
  {
    double result = *(double *)&cocoaVersion_cocoaVersion;
  }
  if (result < 1.0)
  {
    double result = _NSGetUIFoundationVersionNumber() + 1851.0;
    cocoaVersion_cocoaVersion = *(void *)&result;
  }
  return result;
}

- (uint64_t)_writeVersionsAndEncodings
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = (void *)[*(id *)(result + 168) objectForKey:@"ReadOnly"];
    if (v2) {
      uint64_t v3 = [v2 integerValue];
    }
    else {
      uint64_t v3 = 0;
    }
    double v4 = (void *)[*(id *)(v1 + 168) objectForKey:@"NoCocoaVersion"];
    if (v4) {
      BOOL v5 = [v4 integerValue] < 1;
    }
    else {
      BOOL v5 = 1;
    }
    objc_opt_class();
    double v6 = +[NSRTFWriter cocoaVersion]();
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    if (SystemEncoding <= 0xFE && generateOpenStepCompatible)
    {
      CFStringEncoding SystemEncoding = 0;
      if (v5) {
        goto LABEL_11;
      }
    }
    else if (v5)
    {
LABEL_11:
      CFStringConvertEncodingToWindowsCodepage(SystemEncoding);
      if (floor((v6 - floor(v6)) * 1000.0 + 0.5) >= 1.0) {
        snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\\cocoartf%ld\\cocoasubrtf%ld\n");
      }
      else {
        snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\\cocoartf%ld\n");
      }
      *(_DWORD *)(v1 + 152) |= 0x40u;
LABEL_20:
      double result = [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
      if (v3)
      {
        snprintf(__str, 0xC8uLL, "\\readonlydoc%ld", v3);
        return [*(id *)(v1 + 8) appendBytes:__str length:strlen(__str)];
      }
      return result;
    }
    if (SystemEncoding >= 0xFF) {
      uint64_t v8 = "ansi";
    }
    else {
      uint64_t v8 = "mac";
    }
    UInt32 v9 = CFStringConvertEncodingToWindowsCodepage(SystemEncoding);
    snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\n", v8, v9);
    goto LABEL_20;
  }
  return result;
}

- (id)_writeTextScalingAndRenderingHint
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    double result = (id *)[result[21] objectForKey:0x1EDD510D0];
    if (((_BYTE)v1[19] & 0x40) != 0 || result && (double result = (id *)[result doubleValue], v2 >= 2466.0))
    {
      uint64_t v3 = _NSTextScalingTypeForCurrentEnvironment();
      double v4 = (void *)[v1[21] objectForKey:@"TextScaling"];
      if (v4)
      {
        unint64_t v5 = [v4 integerValue];
        if (v5 < 2 && v3 != v5) {
          uint64_t v3 = v5;
        }
      }
      unint64_t v7 = (unint64_t)v1[25];
      if (v7 <= 1)
      {
        *((_DWORD *)v1 + 38) |= 0x20u;
        uint64_t v3 = v7;
      }
      uint64_t v8 = _NSTextScalingTypeForCurrentEnvironment();
      snprintf(__str, 0x64uLL, "\\cocoatextscaling%ld\\cocoaplatform%ld", v3, v8);
      return (id *)[v1[1] appendBytes:__str length:strlen(__str)];
    }
  }
  return result;
}

- (uint64_t)writeStringDocumentAttribute:(const char *)a3 withRTFKeyword:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    double result = [*(id *)(result + 168) objectForKey:a2];
    if (result)
    {
      unint64_t v5 = (__CFString *)result;
      snprintf(__str, 0x64uLL, "\n{%s ", a3);
      [*(id *)(v4 + 8) appendBytes:__str length:strlen(__str)];
      writeCharacters(*(void *)(v4 + 8), v5, 0, [(__CFString *)v5 length], *(_DWORD *)(v4 + 148));
      return [*(id *)(v4 + 8) appendBytes:"}" length:1];
    }
  }
  return result;
}

- (uint64_t)writeDateDocumentAttribute:(const char *)a3 withRTFKeyword:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    double result = [*(id *)(result + 168) objectForKey:a2];
    if (result)
    {
      unint64_t v5 = (void *)result;
      snprintf(__str, 0x64uLL, "\n{%s", a3);
      [*(id *)(v4 + 8) appendBytes:__str length:strlen(__str)];
      -[NSRTFWriter writeDate:](v4, v5);
      return [*(id *)(v4 + 8) appendBytes:"}" length:1];
    }
  }
  return result;
}

- (uint64_t)writeDate:(uint64_t)result
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    [a2 timeIntervalSinceReferenceDate];
    double v5 = v4;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v8 = (void *)[v7 components:252 fromDate:a2];

    snprintf(__str, 0x12CuLL, "\\yr%d\\mo%d\\dy%d\\hr%d\\min%d\\sec%d", [v8 year], objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"));
    double result = [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
    if (v5 < 2147483650.0)
    {
      snprintf(__str, 0x12CuLL, "\\timesinceref%ld", (uint64_t)v5);
      return [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
    }
  }
  return result;
}

- (id)writeKeywordsDocumentAttribute
{
  if (result)
  {
    uint64_t v1 = result;
    double result = (id *)[result[21] objectForKey:@"NSKeywordsDocumentAttribute"];
    if (result)
    {
      double v2 = result;
      double result = (id *)[result count];
      if (result)
      {
        uint64_t v3 = (__CFString *)[v2 componentsJoinedByString:@", "];
        [v1[1] appendBytes:"\n{\\keywords " length:12];
        writeCharacters((uint64_t)v1[1], v3, 0, [(__CFString *)v3 length], *((_DWORD *)v1 + 37));
        id v4 = v1[1];
        return (id *)[v4 appendBytes:"}" length:1];
      }
    }
  }
  return result;
}

- (uint64_t)writeInfo
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = [*(id *)(result + 8) length];
    [v1[1] appendBytes:"{\\info" length:6];
    uint64_t v3 = [v1[1] length];
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSTitleDocumentAttribute", "\\title");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSSubjectDocumentAttribute", "\\subject");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSCommentDocumentAttribute", "\\doccomm");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSAuthorDocumentAttribute", "\\author");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSEditorDocumentAttribute", "\\operator");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSManagerDocumentAttribute", "\\*\\manager");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSCompanyDocumentAttribute", "\\*\\company");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSCopyrightDocumentAttribute", "\\*\\copyright");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSCategoryDocumentAttribute", "\\*\\category");
    -[NSRTFWriter writeDateDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSCreationTimeDocumentAttribute", "\\creatim");
    -[NSRTFWriter writeDateDocumentAttribute:withRTFKeyword:]((uint64_t)v1, @"NSModificationTimeDocumentAttribute", "\\revtim");
    -[NSRTFWriter writeKeywordsDocumentAttribute](v1);
    uint64_t v4 = [v1[1] length];
    id v5 = v1[1];
    if (v4 == v3)
    {
      return [v5 setLength:v2];
    }
    else
    {
      return [v5 appendBytes:"}" length:1];
    }
  }
  return result;
}

- (const)writeColor:(uint64_t)a3 type:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  if (a2) {
    id v5 = (void *)[*((id *)result + 7) objectForKey:a2];
  }
  else {
    id v5 = 0;
  }
  if (*((void *)v4 + 11))
  {
    id v6 = objc_msgSend(*((id *)v4 + 7), "objectForKey:");
    if (v5) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    uint64_t v7 = 1;
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  id v6 = 0;
  if (!v5) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = [v5 unsignedIntegerValue];
  uint64_t v8 = v7;
  if (v6)
  {
LABEL_8:
    uint64_t v9 = [v6 unsignedIntegerValue];
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v9 = 0;
LABEL_12:
  double result = "\\cf%ld ";
  switch(a3)
  {
    case 0:
      goto LABEL_28;
    case 1:
      double result = "\\cb%ld ";
      goto LABEL_27;
    case 2:
      if (!v5) {
        uint64_t v8 = v9;
      }
      double result = "\\strokec%ld ";
      goto LABEL_28;
    case 3:
      if (!v5) {
        uint64_t v8 = v9;
      }
      double result = "\\ulc%ld ";
      goto LABEL_28;
    case 4:
      if (!v5) {
        uint64_t v8 = v9;
      }
      double result = "\\strikec%ld ";
      goto LABEL_28;
    case 5:
      double result = "\\shadc%ld ";
      goto LABEL_28;
    case 6:
      double result = "\\brdrcf%ld ";
      goto LABEL_28;
    case 7:
      double result = "\\clcbpat%ld ";
      goto LABEL_27;
    case 8:
      double result = "\\trcbpat%ld ";
LABEL_27:
      uint64_t v8 = v7;
LABEL_28:
      uint64_t v10 = fmtcheck(result, "%ld");
      snprintf(__str, 0x64uLL, v10, v8);
      double result = (const char *)[*((id *)v4 + 1) appendBytes:__str length:strlen(__str)];
      break;
    default:
      return result;
  }
  return result;
}

- (uint64_t)writeTableHeader:(uint64_t)a3 atIndex:(uint64_t)a4 nestingLevel:
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  uint64_t v245 = 0;
  uint64_t v246 = 0;
  uint64_t v243 = 0;
  unint64_t v244 = 0;
  v183 = (void *)[a2 _rowArrayForBlock:0 atIndex:a3 text:*(void *)(result + 16) layoutManager:0 containerWidth:1 withRepetitions:0 collapseBorders:432.0 rowCharRange:&v245 indexInRow:0 startingRow:&v243 startingColumn:&v244 previousRowBlockHelper:0];
  uint64_t v7 = [v183 count];
  double result = [a2 numberOfColumns];
  unint64_t v184 = result;
  if (!result || !v7) {
    return result;
  }
  int v8 = [*(id *)(v6 + 16) _atStartOfTextTable:a2 atIndex:v245];
  uint64_t v182 = a4;
  if (v246 + v245) {
    int v9 = [*(id *)(v6 + 16) _atEndOfTextTable:a2 atIndex:v246 + v245 - 1];
  }
  else {
    int v9 = 0;
  }
  if (!a2) {
    goto LABEL_118;
  }
  int v231 = v8;
  int v239 = v9;
  uint64_t v10 = [a2 _tableFlags];
  [a2 valueForDimension:0];
  double v12 = v11;
  [a2 valueForDimension:1];
  double v14 = v13;
  [a2 valueForDimension:2];
  double v16 = v15;
  [a2 valueForDimension:4];
  double v18 = v17;
  [a2 valueForDimension:5];
  double v20 = v19;
  [a2 valueForDimension:6];
  double v221 = v21;
  uint64_t v22 = [a2 valueTypeForDimension:0];
  uint64_t v23 = [a2 valueTypeForDimension:1];
  uint64_t v24 = [a2 valueTypeForDimension:2];
  uint64_t v25 = [a2 valueTypeForDimension:4];
  uint64_t v26 = [a2 valueTypeForDimension:5];
  uint64_t v195 = [a2 valueTypeForDimension:6];
  uint64_t v27 = [a2 backgroundColor];
  [a2 widthForLayer:1 edge:1];
  double v29 = v28;
  [a2 widthForLayer:1 edge:2];
  double v227 = v30;
  [a2 widthForLayer:1 edge:3];
  double v225 = v31;
  [a2 widthForLayer:1 edge:0];
  double v223 = v32;
  uint64_t v193 = [a2 widthValueTypeForLayer:1 edge:1];
  uint64_t v201 = [a2 widthValueTypeForLayer:1 edge:2];
  uint64_t v199 = [a2 widthValueTypeForLayer:1 edge:3];
  uint64_t v197 = [a2 widthValueTypeForLayer:1 edge:0];
  [a2 widthForLayer:0 edge:1];
  double v203 = v33;
  [a2 widthForLayer:0 edge:2];
  double v35 = v34;
  [a2 widthForLayer:0 edge:3];
  double v229 = v36;
  [a2 widthForLayer:0 edge:0];
  double v38 = v37;
  uint64_t v185 = [a2 widthValueTypeForLayer:0 edge:1];
  uint64_t v209 = [a2 widthValueTypeForLayer:0 edge:2];
  uint64_t v189 = [a2 widthValueTypeForLayer:0 edge:3];
  uint64_t v205 = [a2 widthValueTypeForLayer:0 edge:0];
  uint64_t v187 = [a2 borderColorForEdge:1];
  uint64_t v213 = [a2 borderColorForEdge:2];
  uint64_t v191 = [a2 borderColorForEdge:3];
  uint64_t v207 = [a2 borderColorForEdge:0];
  [a2 widthForLayer:-1 edge:1];
  double v233 = v39;
  [a2 widthForLayer:-1 edge:2];
  double v241 = v40;
  [a2 widthForLayer:-1 edge:3];
  double v237 = v41;
  [a2 widthForLayer:-1 edge:0];
  double v235 = v42;
  uint64_t v211 = [a2 widthValueTypeForLayer:-1 edge:1];
  uint64_t v219 = [a2 widthValueTypeForLayer:-1 edge:2];
  uint64_t v217 = [a2 widthValueTypeForLayer:-1 edge:3];
  uint64_t v215 = [a2 widthValueTypeForLayer:-1 edge:0];
  snprintf(__str, 0x3E8uLL, "\n\\itap%ld\\trowd \\taflags%ld \\trgaph108\\trleft-108 ", v182 + 1, v10);
  [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  if (v27) {
    -[NSRTFWriter writeColor:type:]((const char *)v6, v27, 8);
  }
  if (v12 > 0.0)
  {
    double v43 = v12 * 50.0 + 0.01;
    if (v22 == 1)
    {
      double v44 = "\\trwWidth%ld\\trftsWidth2 ";
    }
    else
    {
      double v43 = v12 * 20.0 + 0.01;
      double v44 = "\\trwWidth%ld\\trftsWidth3 ";
    }
    snprintf(__str, 0x3E8uLL, v44, vcvtmd_s64_f64(v43));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v14 > 0.0)
  {
    double v45 = v14 * 50.0 + 0.01;
    if (v23 == 1)
    {
      uint64_t v46 = "\\trminwp%ld ";
    }
    else
    {
      double v45 = v14 * 20.0 + 0.01;
      uint64_t v46 = "\\trminw%ld ";
    }
    snprintf(__str, 0x3E8uLL, v46, vcvtmd_s64_f64(v45));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v16 > 0.0)
  {
    double v47 = v16 * 50.0 + 0.01;
    if (v24 == 1)
    {
      uint64_t v48 = "\\trmaxwp%ld ";
    }
    else
    {
      double v47 = v16 * 20.0 + 0.01;
      uint64_t v48 = "\\trmaxw%ld ";
    }
    snprintf(__str, 0x3E8uLL, v48, vcvtmd_s64_f64(v47));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v18 > 0.0)
  {
    double v49 = v18 * 50.0 + 0.01;
    if (v25 == 1)
    {
      uint64_t v50 = "\\taheightp%ld ";
    }
    else
    {
      double v49 = v18 * 20.0 + 0.01;
      uint64_t v50 = "\\taheight%ld ";
    }
    snprintf(__str, 0x3E8uLL, v50, vcvtmd_s64_f64(v49));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v20 > 0.0)
  {
    double v51 = v20 * 50.0 + 0.01;
    if (v26 == 1)
    {
      uint64_t v52 = "\\taminhp%ld ";
    }
    else
    {
      double v51 = v20 * 20.0 + 0.01;
      uint64_t v52 = "\\taminh%ld ";
    }
    snprintf(__str, 0x3E8uLL, v52, vcvtmd_s64_f64(v51));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v221 > 0.0)
  {
    double v53 = v221 * 50.0 + 0.01;
    if (v195 == 1)
    {
      uint64_t v54 = "\\tamaxhp%ld ";
    }
    else
    {
      double v53 = v221 * 20.0 + 0.01;
      uint64_t v54 = "\\tamaxh%ld ";
    }
    snprintf(__str, 0x3E8uLL, v54, vcvtmd_s64_f64(v53));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v29 > 0.0)
  {
    double v55 = v29 * 50.0 + 0.01;
    if (v193 == 1)
    {
      unint64_t v56 = "\\tamartp%ld ";
    }
    else
    {
      double v55 = v29 * 20.0 + 0.01;
      unint64_t v56 = "\\tamart%ld ";
    }
    snprintf(__str, 0x3E8uLL, v56, vcvtmd_s64_f64(v55));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v223 > 0.0)
  {
    double v57 = v223 * 50.0 + 0.01;
    if (v197 == 1)
    {
      v58 = "\\trmarlp%ld ";
    }
    else
    {
      double v57 = v223 * 20.0 + 0.01;
      v58 = "\\trmarl%ld ";
    }
    snprintf(__str, 0x3E8uLL, v58, vcvtmd_s64_f64(v57));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v225 > 0.0)
  {
    double v59 = v225 * 50.0 + 0.01;
    if (v199 == 1)
    {
      uint64_t v60 = "\\tamarbp%ld ";
    }
    else
    {
      double v59 = v225 * 20.0 + 0.01;
      uint64_t v60 = "\\tamarb%ld ";
    }
    snprintf(__str, 0x3E8uLL, v60, vcvtmd_s64_f64(v59));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v227 > 0.0)
  {
    double v61 = v227 * 50.0 + 0.01;
    if (v201 == 1)
    {
      __int16 v62 = "\\trmarrp%ld ";
    }
    else
    {
      double v61 = v227 * 20.0 + 0.01;
      __int16 v62 = "\\trmarr%ld ";
    }
    snprintf(__str, 0x3E8uLL, v62, vcvtmd_s64_f64(v61));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v231)
  {
    if (v203 <= 0.0)
    {
      unint64_t v65 = *(void **)(v6 + 8);
      uint64_t v66 = "\\trbrdrt\\brdrnil ";
      uint64_t v67 = 17;
    }
    else
    {
      double v63 = v203 * 50.0 + 0.01;
      if (v185 == 1)
      {
        unint64_t v64 = "\\trbrdrt\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        double v63 = v203 * 20.0 + 0.01;
        unint64_t v64 = "\\trbrdrt\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v64, vcvtmd_s64_f64(v63));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
      if (v187)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v187, 6);
        goto LABEL_70;
      }
      unint64_t v65 = *(void **)(v6 + 8);
      uint64_t v66 = "\\brdrcfnil ";
      uint64_t v67 = 11;
    }
    [v65 appendBytes:v66 length:v67];
  }
LABEL_70:
  if (v38 <= 0.0)
  {
    uint64_t v70 = *(void **)(v6 + 8);
    unint64_t v71 = "\\trbrdrl\\brdrnil ";
    uint64_t v72 = 17;
  }
  else
  {
    double v68 = v38 * 50.0 + 0.01;
    if (v205 == 1)
    {
      v69 = "\\trbrdrl\\brdrs\\brdrw10\\brdrwp%ld";
    }
    else
    {
      double v68 = v38 * 20.0 + 0.01;
      v69 = "\\trbrdrl\\brdrs\\brdrw%ld";
    }
    snprintf(__str, 0x3E8uLL, v69, vcvtmd_s64_f64(v68));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    if (v207)
    {
      -[NSRTFWriter writeColor:type:]((const char *)v6, v207, 6);
      goto LABEL_79;
    }
    uint64_t v70 = *(void **)(v6 + 8);
    unint64_t v71 = "\\brdrcfnil ";
    uint64_t v72 = 11;
  }
  [v70 appendBytes:v71 length:v72];
LABEL_79:
  if (!v239) {
    goto LABEL_89;
  }
  if (v229 <= 0.0)
  {
    v75 = *(void **)(v6 + 8);
    v76 = "\\trbrdrt\\brdrnil ";
    uint64_t v77 = 17;
  }
  else
  {
    double v73 = v229 * 50.0 + 0.01;
    if (v189 == 1)
    {
      v74 = "\\trbrdrb\\brdrs\\brdrw10\\brdrwp%ld";
    }
    else
    {
      double v73 = v229 * 20.0 + 0.01;
      v74 = "\\trbrdrb\\brdrs\\brdrw%ld";
    }
    snprintf(__str, 0x3E8uLL, v74, vcvtmd_s64_f64(v73));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    if (v191)
    {
      -[NSRTFWriter writeColor:type:]((const char *)v6, v191, 6);
      goto LABEL_89;
    }
    v75 = *(void **)(v6 + 8);
    v76 = "\\brdrcfnil ";
    uint64_t v77 = 11;
  }
  [v75 appendBytes:v76 length:v77];
LABEL_89:
  if (v35 <= 0.0)
  {
    unint64_t v80 = *(void **)(v6 + 8);
    unint64_t v81 = "\\trbrdrr\\brdrnil ";
    uint64_t v82 = 17;
LABEL_97:
    [v80 appendBytes:v81 length:v82];
    goto LABEL_98;
  }
  double v78 = v35 * 50.0 + 0.01;
  if (v209 == 1)
  {
    unint64_t v79 = "\\trbrdrr\\brdrs\\brdrw10\\brdrwp%ld";
  }
  else
  {
    double v78 = v35 * 20.0 + 0.01;
    unint64_t v79 = "\\trbrdrr\\brdrs\\brdrw%ld";
  }
  snprintf(__str, 0x3E8uLL, v79, vcvtmd_s64_f64(v78));
  [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  if (!v213)
  {
    unint64_t v80 = *(void **)(v6 + 8);
    unint64_t v81 = "\\brdrcfnil ";
    uint64_t v82 = 11;
    goto LABEL_97;
  }
  -[NSRTFWriter writeColor:type:]((const char *)v6, v213, 6);
LABEL_98:
  if (v233 > 0.0)
  {
    double v83 = v233 * 50.0 + 0.01;
    if (v211 == 1)
    {
      unint64_t v84 = "\\tapadtp%ld ";
    }
    else
    {
      double v83 = v233 * 20.0 + 0.01;
      unint64_t v84 = "\\tapadt%ld ";
    }
    snprintf(__str, 0x3E8uLL, v84, vcvtmd_s64_f64(v83));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v235 > 0.0)
  {
    double v85 = v235 * 50.0 + 0.01;
    if (v215 == 1)
    {
      v86 = "\\trpadlp%ld ";
    }
    else
    {
      double v85 = v235 * 20.0 + 0.01;
      v86 = "\\trpadl%ld ";
    }
    snprintf(__str, 0x3E8uLL, v86, vcvtmd_s64_f64(v85));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v237 > 0.0)
  {
    double v87 = v237 * 50.0 + 0.01;
    if (v217 == 1)
    {
      v88 = "\\tapadbp%ld ";
    }
    else
    {
      double v87 = v237 * 20.0 + 0.01;
      v88 = "\\tapadb%ld ";
    }
    snprintf(__str, 0x3E8uLL, v88, vcvtmd_s64_f64(v87));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  if (v241 > 0.0)
  {
    double v89 = v241 * 50.0 + 0.01;
    if (v219 == 1)
    {
      uint64_t v90 = "\\trpadrp%ld ";
    }
    else
    {
      double v89 = v241 * 20.0 + 0.01;
      uint64_t v90 = "\\trpadr%ld ";
    }
    snprintf(__str, 0x3E8uLL, v90, vcvtmd_s64_f64(v89));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
LABEL_118:
  unint64_t v91 = 0;
  do
  {
    unint64_t v92 = *(void **)([v183 objectAtIndex:v91] + 8);
    uint64_t v93 = [v92 verticalAlignment];
    [v92 valueForDimension:0];
    double v95 = v94;
    [v92 valueForDimension:1];
    double v97 = v96;
    [v92 valueForDimension:2];
    double v99 = v98;
    [v92 valueForDimension:4];
    double v101 = v100;
    [v92 valueForDimension:5];
    double v103 = v102;
    [v92 valueForDimension:6];
    double v222 = v104;
    uint64_t v105 = [v92 valueTypeForDimension:0];
    uint64_t v106 = [v92 valueTypeForDimension:1];
    uint64_t v107 = [v92 valueTypeForDimension:2];
    uint64_t v108 = [v92 valueTypeForDimension:4];
    uint64_t v186 = [v92 valueTypeForDimension:5];
    uint64_t v190 = [v92 valueTypeForDimension:6];
    uint64_t v109 = [v92 backgroundColor];
    [v92 widthForLayer:1 edge:1];
    double v111 = v110;
    [v92 widthForLayer:1 edge:2];
    double v228 = v112;
    [v92 widthForLayer:1 edge:3];
    double v224 = v113;
    [v92 widthForLayer:1 edge:0];
    double v115 = v114;
    uint64_t v188 = [v92 widthValueTypeForLayer:1 edge:1];
    uint64_t v200 = [v92 widthValueTypeForLayer:1 edge:2];
    uint64_t v194 = [v92 widthValueTypeForLayer:1 edge:3];
    uint64_t v192 = [v92 widthValueTypeForLayer:1 edge:0];
    [v92 widthForLayer:0 edge:1];
    double v226 = v116;
    [v92 widthForLayer:0 edge:2];
    double v236 = v117;
    [v92 widthForLayer:0 edge:3];
    double v232 = v118;
    [v92 widthForLayer:0 edge:0];
    double v230 = v119;
    uint64_t v196 = [v92 widthValueTypeForLayer:0 edge:1];
    uint64_t v212 = [v92 widthValueTypeForLayer:0 edge:2];
    uint64_t v206 = [v92 widthValueTypeForLayer:0 edge:3];
    uint64_t v202 = [v92 widthValueTypeForLayer:0 edge:0];
    uint64_t v198 = [v92 borderColorForEdge:1];
    uint64_t v216 = [v92 borderColorForEdge:2];
    uint64_t v208 = [v92 borderColorForEdge:3];
    uint64_t v204 = [v92 borderColorForEdge:0];
    [v92 widthForLayer:-1 edge:1];
    double v234 = v120;
    [v92 widthForLayer:-1 edge:2];
    double v242 = v121;
    [v92 widthForLayer:-1 edge:3];
    double v240 = v122;
    [v92 widthForLayer:-1 edge:0];
    double v238 = v123;
    uint64_t v210 = [v92 widthValueTypeForLayer:-1 edge:1];
    uint64_t v220 = [v92 widthValueTypeForLayer:-1 edge:2];
    uint64_t v218 = [v92 widthValueTypeForLayer:-1 edge:3];
    uint64_t v214 = [v92 widthValueTypeForLayer:-1 edge:0];
    [*(id *)(v6 + 8) appendBytes:"\n" length:1];
    uint64_t v124 = [v92 startingRow];
    v125 = "\\clvmrg ";
    if (v124 < v243 || (uint64_t v126 = objc_msgSend(v92, "rowSpan", "\\clvmrg "), v125 = "\\clvmgf ", v126 >= 2)) {
      [*(id *)(v6 + 8) appendBytes:v125 length:8];
    }
    unint64_t v127 = objc_msgSend(v92, "startingColumn", v125);
    v128 = "\\clmrg ";
    if (v127 < v91 || (uint64_t v129 = objc_msgSend(v92, "columnSpan", "\\clmrg "), v128 = "\\clmgf ", v129 >= 2)) {
      [*(id *)(v6 + 8) appendBytes:v128 length:7];
    }
    if (v93 == 1)
    {
      v130 = *(void **)(v6 + 8);
      v131 = "\\clvertalc ";
    }
    else
    {
      if (v93 == 3)
      {
        v130 = *(void **)(v6 + 8);
        v131 = "\\clvertalt\\clvertalbase ";
        uint64_t v132 = 24;
        goto LABEL_133;
      }
      v130 = *(void **)(v6 + 8);
      if (v93 == 2) {
        v131 = "\\clvertalb ";
      }
      else {
        v131 = "\\clvertalt ";
      }
    }
    uint64_t v132 = 11;
LABEL_133:
    [v130 appendBytes:v131 length:v132];
    if (v109) {
      -[NSRTFWriter writeColor:type:]((const char *)v6, v109, 7);
    }
    else {
      [*(id *)(v6 + 8) appendBytes:"\\clshdrawnil " length:13];
    }
    if (v95 > 0.0)
    {
      double v133 = v95 * 20.0 + 0.01;
      if (v105 == 1)
      {
        double v133 = v95 * 50.0 + 0.01;
        v134 = "\\clwWidth%ld\\clftsWidth2 ";
      }
      else
      {
        v134 = "\\clwWidth%ld\\clftsWidth3 ";
      }
      snprintf(__str, 0x3E8uLL, v134, vcvtmd_s64_f64(v133));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v97 > 0.0)
    {
      double v135 = v97 * 20.0 + 0.01;
      if (v106 == 1)
      {
        double v135 = v97 * 50.0 + 0.01;
        v136 = "\\clminwp%ld ";
      }
      else
      {
        v136 = "\\clminw%ld ";
      }
      snprintf(__str, 0x3E8uLL, v136, vcvtmd_s64_f64(v135));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v99 > 0.0)
    {
      double v137 = v99 * 20.0 + 0.01;
      if (v107 == 1)
      {
        double v137 = v99 * 50.0 + 0.01;
        v138 = "\\clmaxwp%ld ";
      }
      else
      {
        v138 = "\\clmaxw%ld ";
      }
      snprintf(__str, 0x3E8uLL, v138, vcvtmd_s64_f64(v137));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v101 > 0.0)
    {
      double v139 = v101 * 20.0 + 0.01;
      if (v108 == 1)
      {
        double v139 = v101 * 50.0 + 0.01;
        v140 = "\\clheightp%ld ";
      }
      else
      {
        v140 = "\\clheight%ld ";
      }
      snprintf(__str, 0x3E8uLL, v140, vcvtmd_s64_f64(v139));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v103 > 0.0)
    {
      double v141 = v103 * 20.0 + 0.01;
      if (v186 == 1)
      {
        double v141 = v103 * 50.0 + 0.01;
        v142 = "\\clminhp%ld ";
      }
      else
      {
        v142 = "\\clminh%ld ";
      }
      snprintf(__str, 0x3E8uLL, v142, vcvtmd_s64_f64(v141));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v222 > 0.0)
    {
      double v143 = v222 * 20.0 + 0.01;
      if (v190 == 1)
      {
        double v143 = v222 * 50.0 + 0.01;
        v144 = "\\clmaxhp%ld ";
      }
      else
      {
        v144 = "\\clmaxh%ld ";
      }
      snprintf(__str, 0x3E8uLL, v144, vcvtmd_s64_f64(v143));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v111 > 0.0)
    {
      double v145 = v111 * 20.0 + 0.01;
      if (v188 == 1)
      {
        double v145 = v111 * 50.0 + 0.01;
        v146 = "\\clmartp%ld ";
      }
      else
      {
        v146 = "\\clmart%ld ";
      }
      snprintf(__str, 0x3E8uLL, v146, vcvtmd_s64_f64(v145));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v115 > 0.0)
    {
      double v147 = v115 * 20.0 + 0.01;
      if (v192 == 1)
      {
        double v147 = v115 * 50.0 + 0.01;
        v148 = "\\clmarlp%ld ";
      }
      else
      {
        v148 = "\\clmarl%ld ";
      }
      snprintf(__str, 0x3E8uLL, v148, vcvtmd_s64_f64(v147));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v224 > 0.0)
    {
      double v149 = v224 * 20.0 + 0.01;
      if (v194 == 1)
      {
        double v149 = v224 * 50.0 + 0.01;
        v150 = "\\clmarbp%ld ";
      }
      else
      {
        v150 = "\\clmarb%ld ";
      }
      snprintf(__str, 0x3E8uLL, v150, vcvtmd_s64_f64(v149));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v228 > 0.0)
    {
      double v151 = v228 * 20.0 + 0.01;
      if (v200 == 1)
      {
        double v151 = v228 * 50.0 + 0.01;
        v152 = "\\clmarrp%ld ";
      }
      else
      {
        v152 = "\\clmarr%ld ";
      }
      snprintf(__str, 0x3E8uLL, v152, vcvtmd_s64_f64(v151));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v226 <= 0.0)
    {
      v155 = *(void **)(v6 + 8);
      v156 = "\\clbrdrt\\brdrnil ";
      uint64_t v157 = 17;
    }
    else
    {
      double v153 = v226 * 20.0 + 0.01;
      if (v196 == 1)
      {
        double v153 = v226 * 50.0 + 0.01;
        v154 = "\\clbrdrt\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v154 = "\\clbrdrt\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v154, vcvtmd_s64_f64(v153));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
      if (v198)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v198, 6);
        goto LABEL_195;
      }
      v155 = *(void **)(v6 + 8);
      v156 = "\\brdrcfnil ";
      uint64_t v157 = 11;
    }
    [v155 appendBytes:v156 length:v157];
LABEL_195:
    if (v230 <= 0.0)
    {
      v160 = *(void **)(v6 + 8);
      v161 = "\\clbrdrl\\brdrnil ";
      uint64_t v162 = 17;
    }
    else
    {
      double v158 = v230 * 20.0 + 0.01;
      if (v202 == 1)
      {
        double v158 = v230 * 50.0 + 0.01;
        v159 = "\\clbrdrl\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v159 = "\\clbrdrl\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v159, vcvtmd_s64_f64(v158));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
      if (v204)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v204, 6);
        goto LABEL_204;
      }
      v160 = *(void **)(v6 + 8);
      v161 = "\\brdrcfnil ";
      uint64_t v162 = 11;
    }
    [v160 appendBytes:v161 length:v162];
LABEL_204:
    if (v232 <= 0.0)
    {
      v165 = *(void **)(v6 + 8);
      v166 = "\\clbrdrb\\brdrnil ";
      uint64_t v167 = 17;
    }
    else
    {
      double v163 = v232 * 20.0 + 0.01;
      if (v206 == 1)
      {
        double v163 = v232 * 50.0 + 0.01;
        v164 = "\\clbrdrb\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v164 = "\\clbrdrb\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v164, vcvtmd_s64_f64(v163));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
      if (v208)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v208, 6);
        goto LABEL_213;
      }
      v165 = *(void **)(v6 + 8);
      v166 = "\\brdrcfnil ";
      uint64_t v167 = 11;
    }
    [v165 appendBytes:v166 length:v167];
LABEL_213:
    if (v236 <= 0.0)
    {
      v170 = *(void **)(v6 + 8);
      v171 = "\\clbrdrr\\brdrnil ";
      uint64_t v172 = 17;
    }
    else
    {
      double v168 = v236 * 20.0 + 0.01;
      if (v212 == 1)
      {
        double v168 = v236 * 50.0 + 0.01;
        v169 = "\\clbrdrr\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v169 = "\\clbrdrr\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v169, vcvtmd_s64_f64(v168));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
      if (v216)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v216, 6);
        goto LABEL_222;
      }
      v170 = *(void **)(v6 + 8);
      v171 = "\\brdrcfnil ";
      uint64_t v172 = 11;
    }
    [v170 appendBytes:v171 length:v172];
LABEL_222:
    if (v234 > 0.0)
    {
      double v173 = v234 * 20.0 + 0.01;
      if (v210 == 1)
      {
        double v173 = v234 * 50.0 + 0.01;
        v174 = "\\clpadtp%ld ";
      }
      else
      {
        v174 = "\\clpadt%ld ";
      }
      snprintf(__str, 0x3E8uLL, v174, vcvtmd_s64_f64(v173));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v238 >= 0.0)
    {
      double v175 = v238 * 20.0 + 0.01;
      if (v214 == 1)
      {
        double v175 = v238 * 50.0 + 0.01;
        v176 = "\\clpadlp%ld ";
      }
      else
      {
        v176 = "\\clpadl%ld ";
      }
      snprintf(__str, 0x3E8uLL, v176, vcvtmd_s64_f64(v175));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v240 > 0.0)
    {
      double v177 = v240 * 20.0 + 0.01;
      if (v218 == 1)
      {
        double v177 = v240 * 50.0 + 0.01;
        v178 = "\\clpadbp%ld ";
      }
      else
      {
        v178 = "\\clpadb%ld ";
      }
      snprintf(__str, 0x3E8uLL, v178, vcvtmd_s64_f64(v177));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    if (v242 >= 0.0)
    {
      double v179 = v242 * 20.0 + 0.01;
      if (v220 == 1)
      {
        double v179 = v242 * 50.0 + 0.01;
        v180 = "\\clpadrp%ld ";
      }
      else
      {
        v180 = "\\clpadr%ld ";
      }
      snprintf(__str, 0x3E8uLL, v180, vcvtmd_s64_f64(v179));
      [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
    snprintf(__str, 0x3E8uLL, "\\gaph\\cellx%ld", vcvtmd_s64_f64((double)++v91 * 432.0 / (double)v184 * 20.0 + 0.01));
    [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
  }
  while (v184 != v91);
  double result = [*(id *)(v6 + 8) appendBytes:"\n" length:1];
  if (v244)
  {
    for (unint64_t i = 0; i < v244; ++i)
    {
      snprintf(__str, 0x3E8uLL, "\\pard\\intbl\\itap%ld\\cell\n", v182 + 1);
      double result = [*(id *)(v6 + 8) appendBytes:__str length:strlen(__str)];
    }
  }
  return result;
}

- (uint64_t)writeCellTerminator:(uint64_t)a3 atIndex:(unint64_t)a4 nestingLevel:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v8 = (void *)[a2 table],
          uint64_t v9 = [a2 startingColumn],
          uint64_t v10 = [a2 columnSpan],
          v8))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v8 numberOfColumns];
      int v13 = [*(id *)(v7 + 16) _atEndOfTextTableRow:v8 atIndex:a3];
      int v14 = [*(id *)(v7 + 16) _atEndOfTextTable:v8 atIndex:a3];
      int v15 = v14;
      if (v13)
      {
        int v26 = v14;
        if (v12 - v9 > (unint64_t)v11) {
          uint64_t v11 = v12 - v9;
        }
        int v16 = 1;
      }
      else
      {
        unint64_t v17 = a3 + 1;
        if (v17 >= [*(id *)(v7 + 16) length])
        {
          int v16 = 1;
          int v26 = 1;
        }
        else
        {
          double v18 = objc_msgSend((id)objc_msgSend(*(id *)(v7 + 16), "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v17, 0), "textBlocks");
          int v26 = v15;
          if (v18
            && (double v19 = v18, [v18 count] > a4)
            && (double v20 = (void *)[v19 objectAtIndex:a4], objc_msgSend(v20, "startingColumn") - v9 > v11))
          {
            int v16 = 0;
            uint64_t v11 = [v20 startingColumn] - v9;
          }
          else
          {
            int v16 = 0;
          }
        }
      }
      if (v11 >= 1)
      {
        uint64_t v21 = 0;
        if (a4) {
          uint64_t v22 = "\\nestcell ";
        }
        else {
          uint64_t v22 = "\\cell ";
        }
        if (a4) {
          uint64_t v23 = 10;
        }
        else {
          uint64_t v23 = 6;
        }
        do
        {
          if (v21)
          {
            snprintf(__str, 0x3E8uLL, "\n\\pard\\intbl\\itap%ld", a4 + 1);
            [*(id *)(v7 + 8) appendBytes:__str length:strlen(__str)];
          }
          [*(id *)(v7 + 8) appendBytes:v22 length:v23];
          ++v21;
        }
        while (v11 != v21);
      }
      if (v16)
      {
        if (v26) {
          [*(id *)(v7 + 8) appendBytes:"\\lastrow" length:8];
        }
        if (a4) {
          uint64_t v24 = "\\nestrow";
        }
        else {
          uint64_t v24 = "\\row";
        }
        if (a4) {
          uint64_t v25 = 8;
        }
        else {
          uint64_t v25 = 4;
        }
        [*(id *)(v7 + 8) appendBytes:v24 length:v25];
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)writeParagraphStyle:(uint64_t)result
{
  v56[0] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    if (*(void **)(result + 104) != a2)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "textBlocks"), "count");
      strcpy(__s, "\\pard");
      size_t v5 = strlen(__s);
      uint64_t v6 = &__s[v5];
      if (v4)
      {
        snprintf(&__s[v5], 1000 - v5, "\\intbl\\itap%ld", v4);
        v6 += strlen(v6);
      }
      if (!v2) {
        goto LABEL_81;
      }
      double v51 = v2;
      uint64_t v52 = v3;
      uint64_t v7 = (void *)[v2 tabStops];
      uint64_t v8 = [v7 count];
      if (v8)
      {
        uint64_t v9 = v8;
        for (uint64_t i = 0; i != v9; ++i)
        {
          uint64_t v11 = (void *)[v7 objectAtIndex:i];
          uint64_t v12 = [v11 alignment];
          int v13 = (void *)[v11 options];
          int v14 = v13;
          if (v12 || [v13 count])
          {
            if (![v14 count] || (v15 = objc_msgSend(v11, "tabStopType"), int v16 = "\\tqdec", v15 != 3))
            {
              int v16 = "";
              if (v12 == 1) {
                int v16 = "\\tqc";
              }
              if (v12 == 2) {
                int v16 = "\\tqr";
              }
            }
            snprintf(v6, (char *)v56 - v6, "%s", v16);
            v6 += strlen(v6);
          }
          [v11 location];
          snprintf(v6, (char *)v56 - v6, "\\tx%ld", vcvtmd_s64_f64(v17 * 20.0 + 0.01));
          v6 += strlen(v6);
          if (v6 - __s >= 801)
          {
            snprintf(v6, 1000 - (v6 - __s), "\n");
            uint64_t v6 = __s;
            [*(id *)(v52 + 8) appendBytes:__s length:strlen(__s)];
          }
        }
      }
      uint64_t v2 = v51;
      [v51 defaultTabInterval];
      if (v18 > 0.0)
      {
        snprintf(v6, __s - v6 + 1000, "\\pardeftab%ld", vcvtmd_s64_f64(v18 * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      uint64_t v3 = v52;
      [v51 headIndent];
      double v20 = v19;
      if (v19 != 0.0)
      {
        snprintf(v6, __s - v6 + 1000, "\\li%ld", vcvtmd_s64_f64(v19 * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      [v51 firstLineHeadIndent];
      if (v21 != v20)
      {
        [v51 firstLineHeadIndent];
        snprintf(v6, __s - v6 + 1000, "\\fi%ld", vcvtmd_s64_f64((v22 - v20) * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      [v51 tailIndent];
      if (v23 <= 0.0)
      {
        if (v23 >= 0.0) {
          goto LABEL_31;
        }
        uint64_t v24 = (char *)(__s - v6 + 1000);
        double v25 = -v23;
      }
      else
      {
        uint64_t v24 = (char *)(__s - v6 + 1000);
        double v25 = *(double *)(v52 + 160) - v23;
      }
      snprintf(v6, (size_t)v24, "\\ri%ld", vcvtmd_s64_f64(v25 * 20.0 + 0.01));
      v6 += strlen(v6);
LABEL_31:
      [v51 minimumLineHeight];
      double v27 = v26;
      [v51 maximumLineHeight];
      double v29 = v28;
      [v51 lineHeightMultiple];
      BOOL v31 = v29 == 0.0;
      if (v29 >= 10000000.0) {
        BOOL v31 = 1;
      }
      if (v30 <= 0.0 || v30 == 1.0)
      {
        if (v31)
        {
          if (v27 > 0.0) {
            snprintf(v6, __s - v6 + 1000, "\\sl%ld");
          }
LABEL_48:
          v6 += strlen(v6);
          [v51 lineSpacing];
          if (v33 != 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\slleading%ld", vcvtmd_s64_f64(v33 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          [v51 paragraphSpacingBefore];
          double v35 = v34;
          [v51 paragraphSpacing];
          double v37 = v36;
          if (v35 > 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\sb%ld", vcvtmd_s64_f64(v35 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          if (v37 > 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\sa%ld", vcvtmd_s64_f64(v37 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          uint64_t v38 = [v51 baseWritingDirection];
          NSWritingDirection v39 = v38;
          if (v38)
          {
            double v40 = (char *)(__s - v6 + 1000);
            if (v38 == 1) {
              snprintf(v6, (size_t)v40, "\\rtlpar");
            }
            else {
              snprintf(v6, (size_t)v40, "\\pardirnatural");
            }
            v6 += strlen(v6);
          }
          uint64_t v41 = [v51 alignment];
          if ((*(unsigned char *)(v52 + 152) & 0x10) != 0 || v41 != 4)
          {
            if ((unint64_t)(v41 - 1) > 3) {
              goto LABEL_68;
            }
            double v42 = off_1E55CE028[v41 - 1];
          }
          else
          {
            if (v39 == NSWritingDirectionNatural) {
              NSWritingDirection v39 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
            }
            if (v39 != NSWritingDirectionRightToLeft) {
              goto LABEL_68;
            }
            double v42 = "\\qr";
          }
          snprintf(v6, __s - v6 + 1000, "%s", v42);
          v6 += strlen(v6);
LABEL_68:
          [v51 hyphenationFactor];
          if (v43 > 0.0)
          {
            float v44 = v43;
            if (v43 <= 1.0)
            {
              if (![v51 usesDefaultHyphenation]
                || (+[NSParagraphStyle _defaultHyphenationFactor], v44 != v45))
              {
                snprintf(v6, __s - v6 + 1000, "\\parhyphenfactor%ld", vcvtmd_s64_f64(v44 * 20.0 + 0.01));
                v6 += strlen(v6);
              }
            }
          }
          [v51 tighteningFactorForTruncation];
          unint64_t v47 = vcvtmd_s64_f64(v46 * 20.0 + 0.01);
          if (v47 != 1)
          {
            snprintf(v6, __s - v6 + 1000, "\\partightenfactor%ld", v47);
            v6 += strlen(v6);
          }
          if ([v51 spansAllLines])
          {
            snprintf(v6, __s - v6 + 1000, "\\parspansalllines");
            v6 += strlen(v6);
          }
          uint64_t v54 = 2;
          unsigned __int8 v53 = 0;
          uint64_t v48 = NSTextAlignmentToCTTextAlignment((NSTextAlignment)[v51 alignment]);
          _NSCTTextAlignmentToHorizontalAlignment(v48, &v54, (char *)&v53);
          uint64_t v49 = [v51 horizontalAlignment];
          if (v49 != v54)
          {
            snprintf(v6, __s - v6 + 1000, "\\parhorizalign%ld", v49);
            v6 += strlen(v6);
          }
          int v50 = [v51 isFullyJustified];
          if (v53 != v50)
          {
            snprintf(v6, __s - v6 + 1000, "\\pfullyjustified");
            v6 += strlen(v6);
          }
LABEL_81:
          snprintf(v6, __s - v6 + 1000, "\n");
          [*(id *)(v3 + 8) appendBytes:__s length:strlen(__s)];

          *(void *)(v3 + 104) = v2;
          double result = objc_msgSend(*(id *)(v3 + 88), "isEqual:", -[objc_class blackColor](getNSColorClass_5(), "blackColor"));
          if ((result & 1) == 0) {
            *(_DWORD *)(v3 + 152) |= 1u;
          }
          return result;
        }
        double v32 = (char *)(__s - v6 + 1000);
        if (v29 != v27)
        {
          snprintf(v6, (size_t)v32, "\\sl%ld\\slmaximum%ld");
          goto LABEL_48;
        }
      }
      else
      {
        double v32 = (char *)(__s - v6 + 1000);
        if (v31)
        {
          if (v27 <= 0.0) {
            snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1");
          }
          else {
            snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1\\slminimum%ld");
          }
          goto LABEL_48;
        }
        if (v29 != v27)
        {
          snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1\\slminimum%ld\\slmaximum%ld");
          goto LABEL_48;
        }
      }
      snprintf(v6, (size_t)v32, "\\sl-%ld");
      goto LABEL_48;
    }
  }
  return result;
}

- (uint64_t)writeFont:(char)a3 forceFontNumber:
{
  v55[0] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v5 = result;
  if ([(UIFont *)a2 _isHiraginoFont])
  {
    uint64_t v6 = [(UIFont *)v3 fontName];
    if ([(NSString *)v6 isEqualToString:@"AquaKana"])
    {
      [(UIFont *)v3 pointSize];
      uint64_t v7 = +[UIFont systemFontOfSize:](NSFont, "systemFontOfSize:");
LABEL_8:
      uint64_t v3 = v7;
      goto LABEL_9;
    }
    if ([(NSString *)v6 isEqualToString:@"AquaKana-Bold"])
    {
      [(UIFont *)v3 pointSize];
      uint64_t v7 = +[UIFont boldSystemFontOfSize:](NSFont, "boldSystemFontOfSize:");
      goto LABEL_8;
    }
  }
LABEL_9:
  uint64_t v8 = -[NSRTFWriter _plainFontNameForFont:](v5, v3);
  uint64_t v9 = -[NSRTFWriter _plainFontNameForFont:](v5, *(UIFont **)(v5 + 80));
  __str[0] = 0;
  if ((a3 & 1) != 0 || ([(__CFString *)v8 isEqualToString:v9] & 1) == 0)
  {
    snprintf(__str, 0x64uLL, "\\f%ld", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", v8), "unsignedIntegerValue"));
    uint64_t v10 = &__str[strlen(__str)];
  }
  else
  {
    uint64_t v10 = __str;
  }
  int v11 = [(UIFont *)v3 traits];
  int v12 = *(_DWORD *)(v5 + 144);
  if ((v11 & 1) != (v12 & 1))
  {
    int v13 = "";
    if ((v11 & 1) == 0) {
      int v13 = "0";
    }
    snprintf(v10, __str - v10 + 100, "\\i%s", v13);
    v10 += strlen(v10);
    int v12 = *(_DWORD *)(v5 + 144);
  }
  if ((v11 & 2) != (v12 & 2))
  {
    int v14 = "";
    if ((v11 & 2) == 0) {
      int v14 = "0";
    }
    snprintf(v10, __str - v10 + 100, "\\b%s", v14);
    v10 += strlen(v10);
  }
  *(_DWORD *)(v5 + 144) = v11;
  [(UIFont *)v3 pointSize];
  double v16 = v15;
  if ((*(unsigned char *)(v5 + 152) & 0x20) != 0)
  {
    unint64_t v17 = *(void *)(v5 + 200);
    if (v17 <= 1) {
      double v16 = _NSTextScalingConvertFontPointSize(*(void *)(v5 + 192), v17, v15);
    }
  }
  double v18 = *(void **)(v5 + 80);
  if (!v18 || (a3 & 1) != 0 || ([v18 pointSize], v16 != v19))
  {
    snprintf(v10, (char *)v55 - v10, "\\fs%ld", (uint64_t)(v16 + v16));
    if ((double)(uint64_t)(v16 + v16) * 0.5 != v16)
    {
      size_t v20 = strlen(v10);
      snprintf(&v10[v20], (char *)v55 - &v10[v20], "\\fsmilli%ld", (uint64_t)(v16 * 1000.0 + 0.5));
    }
  }
  if (__str[0])
  {
    [*(id *)(v5 + 8) appendBytes:"\n" length:1];
    [*(id *)(v5 + 8) appendBytes:__str length:strlen(__str)];
    [*(id *)(v5 + 8) appendBytes:" " length:1];
  }
  CFArrayRef v21 = CTFontCopyFeatureSettings((CTFontRef)v3);
  if (v21)
  {
    CFArrayRef v22 = v21;
    CFIndex Count = CFArrayGetCount(v21);
    [*(id *)(v5 + 8) appendBytes:"\\AppleTypeServices" length:18];
    if (Count >= 1)
    {
      CFIndex v24 = 0;
      double v25 = (const void *)*MEMORY[0x1E4F24558];
      double v26 = (const void *)*MEMORY[0x1E4F24548];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v22, v24);
        Value = (void *)CFDictionaryGetValue(ValueAtIndex, v25);
        double v29 = (void *)CFDictionaryGetValue(ValueAtIndex, v26);
        if (Value && v29)
        {
          snprintf(__s, 0x64uLL, "\\AppleTypeServicesF%ld", (unsigned __int16)[v29 integerValue] | (unint64_t)(objc_msgSend(Value, "integerValue") << 16));
          [*(id *)(v5 + 8) appendBytes:__s length:strlen(__s)];
        }
        ++v24;
      }
      while (Count != v24);
    }
    [*(id *)(v5 + 8) appendBytes:" " length:1];
    CFRelease(v22);
    unsigned int v30 = *(_DWORD *)(v5 + 152) | 2;
  }
  else
  {
    int v31 = *(_DWORD *)(v5 + 152);
    if ((v31 & 2) != 0)
    {
      [*(id *)(v5 + 8) appendBytes:"\\AppleTypeServices " length:19];
      int v31 = *(_DWORD *)(v5 + 152);
    }
    unsigned int v30 = v31 & 0xFFFFFFFD;
  }
  *(_DWORD *)(v5 + 152) = v30;
  double v32 = (void *)CTFontCopyAttribute((CTFontRef)v3, (CFStringRef)*MEMORY[0x1E4F245C8]);
  if (v32)
  {
    double v33 = v32;
    snprintf(__s, 0x64uLL, "\\AppleFontPalette%ld ", [v32 integerValue]);
    [*(id *)(v5 + 8) appendBytes:__s length:strlen(__s)];
    CFRelease(v33);
    unsigned int v34 = *(_DWORD *)(v5 + 152) | 4;
  }
  else
  {
    if ((*(unsigned char *)(v5 + 152) & 4) == 0) {
      goto LABEL_47;
    }
    [*(id *)(v5 + 8) appendBytes:"\\AppleFontPalette0 " length:19];
    unsigned int v34 = *(_DWORD *)(v5 + 152) & 0xFFFFFFFB;
  }
  *(_DWORD *)(v5 + 152) = v34;
LABEL_47:
  CFTypeRef v35 = CTFontCopyAttribute((CTFontRef)v3, (CFStringRef)*MEMORY[0x1E4F245D0]);
  CFTypeRef v36 = (id)CFMakeCollectable(v35);
  if (v36)
  {
    double v37 = (void *)v36;
    [*(id *)(v5 + 8) appendBytes:"\\AppleFontPaletteColors" length:23];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v37);
          }
          double v42 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v43 = [v37 objectForKeyedSubscript:v42];
          uint64_t v44 = [(objc_class *)getNSColorClass_5() colorWithCGColor:v43];
          if (v44 && (float v45 = (void *)[*(id *)(v5 + 56) objectForKey:v44]) != 0) {
            unsigned __int16 v46 = [v45 unsignedIntegerValue];
          }
          else {
            unsigned __int16 v46 = 0;
          }
          snprintf(__s, 0x64uLL, "\\AppleFontPaletteColorsMapping%ld", v46 | (unint64_t)([v42 integerValue] << 16));
          [*(id *)(v5 + 8) appendBytes:__s length:strlen(__s)];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v39);
    }
    [*(id *)(v5 + 8) appendBytes:" " length:1];
    unsigned int v47 = *(_DWORD *)(v5 + 152) | 8;
    goto LABEL_62;
  }
  if ((*(unsigned char *)(v5 + 152) & 8) != 0)
  {
    [*(id *)(v5 + 8) appendBytes:"\\AppleFontPaletteColors " length:24];
    unsigned int v47 = *(_DWORD *)(v5 + 152) & 0xFFFFFFF7;
LABEL_62:
    *(_DWORD *)(v5 + 152) = v47;
  }
  double result = CFStringConvertNSStringEncodingToEncoding([(UIFont *)v3 mostCompatibleStringEncoding]);
  if (result <= 0xFE)
  {
    if (generateOpenStepCompatible) {
      double result = 0;
    }
  }
  *(_DWORD *)(v5 + 148) = result;
  return result;
}

- (uint64_t)writeKern:(uint64_t)result
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      [a2 doubleValue];
      if (v3 == 0.0) {
        strcpy(__str, "\\expnd0\\expndtw0\\kerning0\n");
      }
      else {
        snprintf(__str, 0x64uLL, "\\kerning1\\expnd%ld\\expndtw%ld\n", vcvtmd_s64_f64(v3 * 4.0 + 0.01), vcvtmd_s64_f64(v3 * 20.0 + 0.01));
      }
      return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
    }
    else
    {
      uint64_t v4 = *(void **)(result + 8);
      return [v4 appendBytes:"\\kerning1\\expnd0\\expndtw0 " length:26];
    }
  }
  return result;
}

- (uint64_t)writeUnderlineStyle:(uint64_t)result allowStrikethrough:(void *)a2
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (!a2)
  {
    uint64_t v5 = 0;
    unint64_t v4 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = [a2 unsignedIntegerValue];
  unint64_t v4 = v3;
  uint64_t v5 = v3 & 0xF00;
  if ((v3 & 0xF) == 0)
  {
LABEL_7:
    strcpy(__str, "\\ulnone ");
    goto LABEL_17;
  }
  if ((v3 & 0x8F0F) == 0x8001)
  {
    strcpy(&__str[4], " ");
    int v6 = 2003596636;
  }
  else
  {
    if ((v3 & 0xF0F) != 9)
    {
      switch((unint64_t)(v5 - 256) >> 8)
      {
        case 0uLL:
          snprintf(__str, 0x64uLL, "\\ul%sd ");
          break;
        case 1uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdash ");
          break;
        case 2uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdashd ");
          break;
        case 3uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdashdd ");
          break;
        default:
          snprintf(__str, 0x64uLL, "\\ul%s ");
          break;
      }
      goto LABEL_17;
    }
    strcpy(&__str[3], "db ");
    int v6 = 1684829532;
  }
  *(_DWORD *)__str = v6;
LABEL_17:
  double result = [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  if ((v4 > 9 || ((1 << v4) & 0x203) == 0) && v4 != 32769 && v4 != (v5 | 1) && v4 != (v5 | 2))
  {
    snprintf(__str, 0x64uLL, "\\ulstyle%ld ", v4);
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeStrikethroughStyle:(uint64_t)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (a2)
  {
    uint64_t v3 = [a2 unsignedIntegerValue];
    unint64_t v4 = v3;
    if ((v3 & 0xF) == 9)
    {
      strcpy(&__s[7], "d1 ");
      uint64_t v5 = "\\striked1 ";
LABEL_11:
      *(void *)__s = *(void *)v5;
      goto LABEL_12;
    }
    if ((v3 & 0xF) != 0)
    {
      if ((v3 & 0x8000) != 0)
      {
        strcpy(&__s[8], " ");
        uint64_t v5 = "\\strikew ";
      }
      else
      {
        __s[8] = 0;
        uint64_t v5 = "\\strike ";
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  strcpy(__s, "\\strike0\\striked0 ");
LABEL_12:
  double result = [*(id *)(v2 + 8) appendBytes:__s length:strlen(__s)];
  if ((v4 > 9 || ((1 << v4) & 0x203) == 0) && v4 != 32769)
  {
    snprintf(__s, 0x64uLL, "\\strikestyle%ld ", v4);
    return [*(id *)(v2 + 8) appendBytes:__s length:strlen(__s)];
  }
  return result;
}

- (uint64_t)writeSuperscript:(uint64_t)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      uint64_t v3 = [a2 integerValue];
      if (v3 == -1)
      {
        strcpy(__str, "\\sub ");
        return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
      }
      if (v3 == 1)
      {
        strcpy(__str, "\\super ");
        return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
      }
      if (v3)
      {
        if (v3 >= 0) {
          unint64_t v4 = "\\super%ld ";
        }
        else {
          unint64_t v4 = "\\sub%ld ";
        }
        if (v3 >= 0) {
          uint64_t v5 = v3;
        }
        else {
          uint64_t v5 = -v3;
        }
        snprintf(__str, 0x64uLL, v4, v5);
        return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
      }
    }
    strcpy(__str, "\\nosupersub ");
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeHighlightStyle:(uint64_t)result
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if ([a2 length])
    {
      NSUInteger v4 = [(NSArray *)+[NSRTFReader defaultTextHighlightStyles] indexOfObject:a2];
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v5 = [*(id *)(v3 + 208) indexOfObject:a2];
        if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v6 = 0;
        }
        else {
          NSUInteger v6 = v5 + 1;
        }
      }
      else
      {
        NSUInteger v6 = ~v4;
      }
    }
    else
    {
      NSUInteger v6 = 0;
    }
    snprintf(__str, 0x64uLL, "\\AppleHighlight%ld ", v6);
    return [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeHighlightColorScheme:(uint64_t)result
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if ([a2 length])
    {
      NSUInteger v4 = [(NSArray *)+[NSRTFReader defaultTextHighlightColorSchemes] indexOfObject:a2];
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v5 = [*(id *)(v3 + 216) indexOfObject:a2];
        if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v6 = 0;
        }
        else {
          NSUInteger v6 = v5 + 1;
        }
      }
      else
      {
        NSUInteger v6 = ~v4;
      }
    }
    else
    {
      NSUInteger v6 = 0;
    }
    snprintf(__str, 0x64uLL, "\\AppleHilightClrSch%ld ", v6);
    return [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeBaselineOffset:(uint64_t)result
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2 && ([a2 doubleValue], (vcvtmd_s64_f64(v3 * 2.0 + 0.01) & 0x8000000000000000) != 0)) {
      snprintf(__str, 0x64uLL, "\\dn%ld ");
    }
    else {
      snprintf(__str, 0x64uLL, "\\up%ld ");
    }
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeLigature:(uint64_t)result
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2) {
      uint64_t v3 = [a2 integerValue];
    }
    else {
      uint64_t v3 = 1;
    }
    snprintf(__str, 0x20uLL, "\\CocoaLigature%ld ", v3);
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeCharacterShape:(uint64_t)result
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    snprintf(__str, 0x20uLL, "\\AppleTypeServices%c%ld ", 85, [a2 integerValue]);
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeStrokeWidth:(uint64_t)result
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      [a2 doubleValue];
      if (v3 > 0.0)
      {
        uint64_t v4 = "\\outl\\strokewidth%ld ";
LABEL_7:
        snprintf(__str, 0x20uLL, v4, vcvtmd_s64_f64(v3 * 20.0 + 0.01));
        return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
      }
    }
    else
    {
      double v3 = 0.0;
    }
    uint64_t v4 = "\\outl0\\strokewidth%ld ";
    goto LABEL_7;
  }
  return result;
}

- (uint64_t)writeObliqueness:(uint64_t)result
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      [a2 doubleValue];
      double v4 = v3 * 100.0;
    }
    else
    {
      double v4 = 0.0;
    }
    snprintf(__str, 0x20uLL, "\\obliqueness%ld ", vcvtmd_s64_f64(v4 * 20.0 + 0.01));
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)writeExpansion:(uint64_t)result
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      [a2 doubleValue];
      double v4 = v3 * 100.0;
    }
    else
    {
      double v4 = 0.0;
    }
    snprintf(__str, 0x20uLL, "\\expansion%ld ", vcvtmd_s64_f64(v4 * 20.0 + 0.01));
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (const)writeShadow:(const char *)result
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    double v3 = result;
    double v14 = 0.0;
    double v15 = 0.0;
    double v12 = 0.333333333;
    double v13 = 0.0;
    if (!a2
      || ([a2 shadowOffset],
          double v5 = v4,
          double v7 = v6,
          [a2 shadowBlurRadius],
          double v9 = v8,
          (uint64_t v10 = (void *)[a2 shadowColor]) == 0)
      || v5 == 0.0 && v7 == 0.0 && v9 == 0.0)
    {
      strcpy(__s, "\\shad0 ");
      return (const char *)[*((id *)v3 + 1) appendBytes:__s length:strlen(__s)];
    }
    else
    {
      [(id)RGBColorForColor(v10) getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
      snprintf(__s, 0xC8uLL, "\\shad\\shadx%ld\\shady%ld\\shadr%ld\\shado%ld ", vcvtmd_s64_f64(v5 * 20.0 + 0.01), vcvtmd_s64_f64(-v7 * 20.0 + 0.01), vcvtmd_s64_f64(v9 * 20.0 + 0.01), (uint64_t)(v12 * 255.0 + 0.5));
      [*((id *)v3 + 1) appendBytes:__s length:strlen(__s)];
      uint64_t v11 = [(objc_class *)getNSColorClass_5() colorWithCalibratedRed:v15 green:v14 blue:v13 alpha:1.0];
      return -[NSRTFWriter writeColor:type:](v3, v11, 5);
    }
  }
  return result;
}

- (void)restoreAttributes:(uint64_t)a1
{
  if (a1)
  {
    double v4 = (void *)[a2 objectForKey:@"NSFont"];
    if (!v4) {
      double v4 = NSDefaultFont();
    }
    double v5 = (void *)[a2 objectForKey:@"NSColor"];
    double v6 = (void *)[a2 objectForKey:@"NSBackgroundColor"];
    double v7 = (void *)[a2 objectForKey:@"NSKern"];
    double v8 = (void *)[a2 objectForKey:@"NSBaselineOffset"];
    double v9 = (void *)[a2 objectForKey:@"NSSuperScript"];
    uint64_t v10 = (void *)[a2 objectForKey:@"NSUnderline"];
    uint64_t v11 = (void *)[a2 objectForKeyedSubscript:@"NSTextHighlightStyle"];
    double v12 = (void *)[a2 objectForKeyedSubscript:@"NSTextHighlightColorScheme"];
    double v13 = *(void **)(a1 + 80);
    if (v4 != v13)
    {

      double v14 = (void *)[v4 copyWithZone:0];
      *(void *)(a1 + 80) = v14;
      *(_DWORD *)(a1 + 144) = [v14 traits];
      CFStringEncoding v15 = CFStringConvertNSStringEncodingToEncoding([*(id *)(a1 + 80) mostCompatibleStringEncoding]);
      if (v15 <= 0xFE && generateOpenStepCompatible) {
        CFStringEncoding v15 = 0;
      }
      *(_DWORD *)(a1 + 148) = v15;
      CFArrayRef v16 = CTFontCopyFeatureSettings(*(CTFontRef *)(a1 + 80));
      unsigned int v17 = *(_DWORD *)(a1 + 152) & 0xFFFFFFFD;
      *(_DWORD *)(a1 + 152) = v17;
      if (v16)
      {
        CFArrayRef v18 = v16;
        if (CFArrayGetCount(v16) >= 1) {
          *(_DWORD *)(a1 + 152) |= 2u;
        }
        CFRelease(v18);
        unsigned int v17 = *(_DWORD *)(a1 + 152);
      }
      *(_DWORD *)(a1 + 152) = v17 & 0xFFFFFFFB;
      CFTypeRef v19 = CTFontCopyAttribute(*(CTFontRef *)(a1 + 80), (CFStringRef)*MEMORY[0x1E4F245C8]);
      if (v19)
      {
        *(_DWORD *)(a1 + 152) |= 4u;
        CFRelease(v19);
      }
    }
    size_t v20 = *(void **)(a1 + 88);
    if (v5 != v20)
    {

      *(void *)(a1 + 88) = [v5 copyWithZone:0];
    }
    CFArrayRef v21 = *(void **)(a1 + 96);
    if (v6 != v21)
    {

      *(void *)(a1 + 96) = [v6 copyWithZone:0];
    }
    CFArrayRef v22 = *(void **)(a1 + 112);
    if (v7 != v22)
    {

      *(void *)(a1 + 112) = [v7 copyWithZone:0];
    }
    double v23 = *(void **)(a1 + 120);
    if (v8 != v23)
    {

      *(void *)(a1 + 120) = [v8 copyWithZone:0];
    }
    CFIndex v24 = *(void **)(a1 + 128);
    if (v9 != v24)
    {

      *(void *)(a1 + 128) = [v9 copyWithZone:0];
    }
    double v25 = *(void **)(a1 + 136);
    if (v10 != v25)
    {

      *(void *)(a1 + 136) = [v10 copyWithZone:0];
    }
    double v26 = *(void **)(a1 + 224);
    if (v11 != v26)
    {

      uint64_t v11 = (void *)[v11 copy];
      *(void *)(a1 + 224) = v11;
    }
    if (!v11 || [v12 isEqualToString:@"NSTextHighlightColorSchemeDefault"]) {
      double v12 = 0;
    }
    double v27 = *(void **)(a1 + 232);
    if (v12 != v27)
    {

      *(void *)(a1 + 232) = [v12 copy];
    }
  }
}

- (unint64_t)writeCharacterAttributes:(void *)a3 previousAttributes:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  double v6 = (UIFont *)[a2 objectForKey:@"NSFont"];
  if (!v6) {
    double v6 = (UIFont *)NSDefaultFont();
  }
  double v7 = (void *)[a2 objectForKey:@"NSColor"];
  uint64_t v39 = [a2 objectForKey:@"NSBackgroundColor"];
  uint64_t v43 = (void *)[a2 objectForKey:@"NSKern"];
  uint64_t v41 = [a2 objectForKey:@"NSBaselineOffset"];
  uint64_t v44 = (void *)[a2 objectForKey:@"NSSuperScript"];
  float v45 = (void *)[a2 objectForKey:@"NSUnderline"];
  uint64_t v40 = (void *)[a2 objectForKey:NSCharacterShapeAttributeName];
  double v55 = (void *)[a3 objectForKey:NSCharacterShapeAttributeName];
  double v8 = (void *)[a2 objectForKey:@"NSLigature"];
  long long v51 = (void *)[a3 objectForKey:@"NSLigature"];
  uint64_t v37 = [a2 objectForKey:@"NSUnderlineColor"];
  uint64_t v34 = [a3 objectForKey:@"NSUnderlineColor"];
  double v57 = (void *)[a2 objectForKey:@"NSStrikethrough"];
  unint64_t v56 = (void *)[a3 objectForKey:@"NSStrikethrough"];
  uint64_t v46 = [a2 objectForKey:@"NSStrikethroughColor"];
  uint64_t v35 = [a3 objectForKey:@"NSStrikethroughColor"];
  uint64_t v54 = (void *)[a2 objectForKey:@"NSStrokeWidth"];
  uint64_t v48 = [a3 objectForKey:@"NSStrokeWidth"];
  uint64_t v38 = [a2 objectForKey:@"NSStrokeColor"];
  uint64_t v36 = [a3 objectForKey:@"NSStrokeColor"];
  double v9 = (void *)[a2 objectForKey:@"NSObliqueness"];
  uint64_t v50 = [a3 objectForKey:@"NSObliqueness"];
  unsigned __int8 v53 = (void *)[a2 objectForKey:@"NSExpansion"];
  uint64_t v49 = [a3 objectForKey:@"NSExpansion"];
  uint64_t v52 = (void *)[a2 objectForKey:@"NSShadow"];
  uint64_t v47 = [a3 objectForKey:@"NSShadow"];
  uint64_t v10 = (void *)[a2 objectForKey:@"NSWritingDirection"];
  uint64_t v11 = (void *)[a3 objectForKey:@"NSWritingDirection"];
  double v12 = (void *)[a2 objectForKeyedSubscript:@"NSTextHighlightStyle"];
  double v42 = (void *)[a2 objectForKeyedSubscript:@"NSTextHighlightColorScheme"];
  if (a3)
  {
    double v13 = *(UIFont **)(v5 + 80);
    double v14 = (void *)v41;
  }
  else
  {
    uint64_t v15 = NSDefaultFont();
    double v13 = *(UIFont **)(v5 + 80);
    double v14 = (void *)v41;
    if ((UIFont *)v15 == v13)
    {
      char v17 = 1;
      CFArrayRef v16 = (void *)v39;
      goto LABEL_10;
    }
  }
  CFArrayRef v16 = (void *)v39;
  if (v6 != v13)
  {
    char v17 = 0;
LABEL_10:
    -[NSRTFWriter writeFont:forceFontNumber:](v5, v6, v17);

    *(void *)(v5 + 80) = [(UIFont *)v6 copyWithZone:0];
  }
  if (v7 != *(void **)(v5 + 88) || (*(unsigned char *)(v5 + 152) & 1) != 0)
  {
    -[NSRTFWriter writeColor:type:]((const char *)v5, (uint64_t)v7, 0);

    int v18 = 0;
    *(void *)(v5 + 88) = [v7 copyWithZone:0];
    *(_DWORD *)(v5 + 152) &= ~1u;
  }
  else
  {
    int v18 = 1;
  }
  if (v16 != *(void **)(v5 + 96))
  {
    -[NSRTFWriter writeColor:type:]((const char *)v5, (uint64_t)v16, 1);

    *(void *)(v5 + 96) = [v16 copyWithZone:0];
  }
  if (v43 != *(void **)(v5 + 112))
  {
    -[NSRTFWriter writeKern:](v5, v43);

    *(void *)(v5 + 112) = [v43 copyWithZone:0];
  }
  if (v14 != *(void **)(v5 + 120))
  {
    -[NSRTFWriter writeBaselineOffset:](v5, v14);

    *(void *)(v5 + 120) = [v14 copyWithZone:0];
  }
  if (v44 != *(void **)(v5 + 128))
  {
    -[NSRTFWriter writeSuperscript:](v5, v44);

    *(void *)(v5 + 128) = [v44 copyWithZone:0];
  }
  if (v12 != *(void **)(v5 + 224))
  {
    -[NSRTFWriter writeHighlightStyle:](v5, v12);

    double v12 = (void *)[v12 copy];
    *(void *)(v5 + 224) = v12;
  }
  CFTypeRef v19 = v42;
  if (!v12 || [v42 isEqualToString:@"NSTextHighlightColorSchemeDefault"]) {
    CFTypeRef v19 = 0;
  }
  if (v19 != *(void **)(v5 + 232))
  {
    -[NSRTFWriter writeHighlightColorScheme:](v5, v19);

    *(void *)(v5 + 232) = [v19 copy];
  }
  if (v45 != *(void **)(v5 + 136))
  {
    -[NSRTFWriter writeUnderlineStyle:allowStrikethrough:](v5, v45);

    *(void *)(v5 + 136) = [v45 copyWithZone:0];
  }
  if ([v45 unsignedIntegerValue])
  {
    char v20 = v37 ? 1 : v18;
    if (v37 != v34 || (v20 & 1) == 0) {
      -[NSRTFWriter writeColor:type:]((const char *)v5, v37, 3);
    }
  }
  uint64_t v21 = [v57 unsignedIntegerValue];
  if (v21 != [v56 unsignedIntegerValue]) {
    -[NSRTFWriter writeStrikethroughStyle:](v5, v57);
  }
  if ([v57 unsignedIntegerValue])
  {
    int v22 = v46 ? 1 : v18;
    if (v46 != v35
      || !v22
      || (uint64_t v23 = [v57 unsignedIntegerValue], v23 != objc_msgSend(v56, "unsignedIntegerValue")))
    {
      -[NSRTFWriter writeColor:type:]((const char *)v5, v46, 4);
    }
  }
  if (v8) {
    uint64_t v24 = [v8 integerValue];
  }
  else {
    uint64_t v24 = 1;
  }
  if (v51) {
    uint64_t v25 = [v51 integerValue];
  }
  else {
    uint64_t v25 = 1;
  }
  if (v24 != v25) {
    -[NSRTFWriter writeLigature:](v5, v8);
  }
  uint64_t v26 = [v40 integerValue];
  double result = [v55 integerValue];
  if (v26 != result) {
    double result = -[NSRTFWriter writeCharacterShape:](v5, v40);
  }
  if (v54 != (void *)v48) {
    double result = -[NSRTFWriter writeStrokeWidth:](v5, v54);
  }
  if (v54)
  {
    char v27 = v38 ? 1 : v18;
    if (v38 != v36 || (v27 & 1) == 0) {
      double result = (unint64_t)-[NSRTFWriter writeColor:type:]((const char *)v5, v38, 2);
    }
  }
  if (v9 != (void *)v50) {
    double result = -[NSRTFWriter writeObliqueness:](v5, v9);
  }
  if (v53 != (void *)v49) {
    double result = -[NSRTFWriter writeExpansion:](v5, v53);
  }
  if (v52 != (void *)v47) {
    double result = (unint64_t)-[NSRTFWriter writeShadow:]((const char *)v5, v52);
  }
  if (v10 != v11)
  {
    double result = [v10 isEqual:v11];
    if ((result & 1) == 0)
    {
      unint64_t v28 = [v10 count];
      double result = [v11 count];
      unint64_t v29 = result;
      unint64_t v30 = 0;
      if (result >= v28) {
        unint64_t v31 = v28;
      }
      else {
        unint64_t v31 = result;
      }
      if (v31)
      {
        while (1)
        {
          double result = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v30), "isEqual:", objc_msgSend(v11, "objectAtIndex:", v30));
          if (!result) {
            break;
          }
          if (v31 == ++v30)
          {
            unint64_t v30 = v31;
            break;
          }
        }
      }
      unint64_t v32 = v29 - v30;
      if (v29 > v30)
      {
        do
        {
          v59[0] = 8236;
          double result = writeCharacters(*(void *)(v5 + 8), (const __CFString *)[NSString stringWithCharacters:v59 length:1], 0, 1, *(_DWORD *)(v5 + 148));
          --v32;
        }
        while (v32);
      }
      if (v30 < v28)
      {
        do
        {
          __int16 v58 = 8234;
          char v33 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v30), "unsignedIntegerValue");
          if (v33) {
            ++v58;
          }
          if ((v33 & 2) != 0) {
            v58 += 3;
          }
          double result = writeCharacters(*(void *)(v5 + 8), (const __CFString *)[NSString stringWithCharacters:&v58 length:1], 0, 1, *(_DWORD *)(v5 + 148));
          ++v30;
        }
        while (v28 != v30);
      }
    }
  }
  return result;
}

- (uint64_t)_attachmentData
{
  if (result)
  {
    uint64_t v1 = result;
    double result = *(void *)(result + 184);
    if (!result)
    {
      id v2 = (id)[MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
      *(void *)(v1 + 184) = v2;
      objc_msgSend((id)objc_msgSend(v2, "keyPointerFunctions"), "setHashFunction:", thoroughDataHash);
      return *(void *)(v1 + 184);
    }
  }
  return result;
}

- (uint64_t)writeAttachment:(uint64_t)result editableData:(void *)a2 editableTypeIdentifier:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    double v4 = *(void **)(result + 32);
    uint64_t v5 = (void *)[a2 fileWrapper];
    double result = [v5 isRegularFile];
    if (result)
    {
      double result = -[NSRTFWriter _attachmentData](v3);
      double v6 = (void *)result;
      if (!a2) {
        return result;
      }
    }
    else
    {
      double v6 = 0;
      if (!a2) {
        return result;
      }
    }
    if (v4 && v5)
    {
      if (v6)
      {
        uint64_t v7 = [v5 regularFileContents];
        double v8 = (void *)[v6 objectForKey:v7];
        if (!v8)
        {
          double v8 = (void *)[v4 addFileWrapper:v5];
          [v6 setObject:v8 forKey:v7];
        }
      }
      else
      {
        double v8 = (void *)[v4 addFileWrapper:v5];
      }
      if ([a2 attachmentCell])
      {
        objc_msgSend((id)objc_msgSend(a2, "attachmentCell"), "cellSize");
      }
      else
      {
        uint64_t v11 = (void *)[a2 image];
        if (!v11)
        {
          double v12 = *MEMORY[0x1E4F28AE0];
          double v13 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
          goto LABEL_17;
        }
        [v11 size];
      }
      double v12 = v9;
      double v13 = v10;
LABEL_17:
      [*(id *)(v3 + 8) appendBytes:"{{\\NeXTGraphic " length:15];
      -[NSRTFWriter writeEscapedUTF8String:](v3, v8);
      snprintf(__str, 0x400uLL, " \\width%ld \\height%ld", vcvtmd_s64_f64(v12 * 20.0 + 0.01), vcvtmd_s64_f64(v13 * 20.0 + 0.01));
      [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
      [a2 lineLayoutPadding];
      unint64_t v15 = vcvtmd_s64_f64(v14 * 20.0 + 0.01);
      uint64_t v16 = [a2 embeddingType];
      unint64_t v17 = [a2 standaloneAlignment] - 1;
      if (v17 > 2) {
        uint64_t v18 = 108;
      }
      else {
        uint64_t v18 = dword_18E5F7910[v17];
      }
      int v19 = [a2 allowsTextAttachmentView];
      char v20 = " \\applenoattachmentview";
      if (v19) {
        char v20 = "";
      }
      snprintf(__str, 0x400uLL, " \\appleattachmentpadding%ld \\appleembedtype%ld \\appleaq%c%s", v15, v16, v18, v20);
      [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
      uint64_t v21 = (void *)[a2 adaptiveImageGlyph];
      if (v21)
      {
        int v22 = (void *)[v21 contentIdentifier];
        if ([v22 length])
        {
          strcpy(__str, " \\appleemojiimage ");
          [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
          -[NSRTFWriter writeEscapedUTF8String:](v3, v22);
        }
      }
      snprintf(__str, 0x400uLL, "\n}%c}", 172);
      return [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
    }
  }
  return result;
}

- (uint64_t)writeImageGlyph:(uint64_t)a3 attributes:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  if (!a2) {
    return result;
  }
  uint64_t v4 = result;
  uint64_t v5 = *(void **)(result + 32);
  if (!v5) {
    return result;
  }
  uint64_t v6 = a3;
  if ((*(_DWORD *)(result + 152) & 0x80) != 0) {
    a3 = 0;
  }
  uint64_t v7 = (void *)[a2 _configuredFileWrapperForAttributes:a3];
  uint64_t v8 = 0;
  double v9 = 0;
  if (![v7 isRegularFile]) {
    goto LABEL_11;
  }
  double v9 = (void *)-[NSRTFWriter _attachmentData](v4);
  if (!v9)
  {
    uint64_t v8 = 0;
LABEL_11:
    double v10 = (void *)[v5 addFileWrapper:v7];
    [v9 setObject:v10 forKey:v8];
    goto LABEL_12;
  }
  uint64_t v8 = [v7 regularFileContents];
  double v10 = (void *)[v9 objectForKey:v8];
  if (!v10) {
    goto LABEL_11;
  }
LABEL_12:
  [*(id *)(v4 + 8) appendBytes:"{{\\NeXTGraphic " length:15];
  -[NSRTFWriter writeEscapedUTF8String:](v4, v10);
  [a2 _imageSizeForAttributes:v6];
  snprintf(__str, 0x400uLL, " \\width%ld \\height%ld", vcvtmd_s64_f64(v11 * 20.0 + 0.01), vcvtmd_s64_f64(v12 * 20.0 + 0.01));
  [*(id *)(v4 + 8) appendBytes:__str length:strlen(__str)];
  double v13 = (void *)[a2 contentIdentifier];
  if ([v13 length])
  {
    strcpy(__str, " \\appleemojiimage ");
    [*(id *)(v4 + 8) appendBytes:__str length:strlen(__str)];
    -[NSRTFWriter writeEscapedUTF8String:](v4, v13);
  }
  snprintf(__str, 0x400uLL, "\n}%c}", 172);
  return [*(id *)(v4 + 8) appendBytes:__str length:strlen(__str)];
}

- (uint64_t)writeGlyphInfo:(uint64_t)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[a2 glyphName];
    if (v4)
    {
      strcpy(__str, "{}{\\*\\glid ");
    }
    else
    {
      if ([a2 characterCollection]) {
        uint64_t v5 = [a2 characterIdentifier];
      }
      else {
        uint64_t v5 = [a2 _glyph];
      }
      snprintf(__str, 0xC8uLL, "{}{\\*\\glid%ld ", v5);
    }
    [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
    -[NSRTFWriter writeEscapedUTF8String:](v3, (void *)[a2 _baseString]);
    if (v4)
    {
      [*(id *)(v3 + 8) appendBytes:"\\glnam " length:7];
      -[NSRTFWriter writeEscapedUTF8String:](v3, v4);
    }
    else if ([a2 characterCollection])
    {
      snprintf(__str, 0xC8uLL, "\\glcol%ld", [a2 characterCollection]);
      [*(id *)(v3 + 8) appendBytes:__str length:strlen(__str)];
    }
    return [*(id *)(v3 + 8) appendBytes:"}" length:1];
  }
  return result;
}

- (CFDataRef)writeLinkInfo:(CFDataRef)result
{
  if (!result) {
    return result;
  }
  CFDataRef v3 = result;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a2 = (const __CFURL *)[MEMORY[0x1E4F1CB10] URLWithString:a2];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (!a2) {
    return 0;
  }
  double result = CFURLCreateData(0, a2, 0x8000100u, 1u);
  if (result)
  {
    CFDataRef v4 = result;
    [*((id *)v3 + 1) appendBytes:"{\\field{\\*\\fldinst{HYPERLINK \"" length:30];
    uint64_t v5 = (void *)*((void *)v3 + 1);
    BytePtr = CFDataGetBytePtr(v4);
    CFIndex Length = CFDataGetLength(v4);
    if (Length >= 1)
    {
      CFIndex v8 = Length;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      do
      {
        unsigned int v11 = BytePtr[v9] - 92;
        BOOL v12 = v11 > 0x21;
        uint64_t v13 = (1 << v11) & 0x280000001;
        if (!v12 && v13 != 0)
        {
          if (v10 < v9) {
            [v5 appendBytes:&BytePtr[v10] length:v9 - v10];
          }
          [v5 appendBytes:"\\"" length:1];
          uint64_t v10 = v9;
        }
        ++v9;
      }
      while (v8 != v9);
      if (v8 > v10) {
        [v5 appendBytes:&BytePtr[v10] length:v8 - v10];
      }
    }
    [*((id *)v3 + 1) appendBytes:"\"}}{\\fldrslt " length:13];
    CFRelease(v4);
    return (CFDataRef)1;
  }
  return result;
}

- (uint64_t)textFlowWithAttributes:(NSUInteger *)a3 range:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = (void *)[a2 objectForKey:@"CTVerticalForms"];
  uint64_t v6 = *(void *)(a1 + 176);
  if (v6 && *(void *)(v6 + 8))
  {
    uint64_t v7 = 0;
    CFIndex v8 = (uint64_t *)(v6 + 16);
    do
    {
      v9.NSUInteger length = a3[1];
      v10.NSUInteger location = *(v8 - 2);
      if (v9.length + *a3 < v10.location) {
        break;
      }
      v10.NSUInteger length = *(v8 - 1);
      v9.NSUInteger location = *a3;
      NSRange v12 = NSIntersectionRange(v10, v9);
      NSUInteger length = v12.length;
      if (v12.length)
      {
        if (v12.location == *a3) {
          uint64_t v7 = *v8;
        }
        else {
          NSUInteger length = v12.location - *a3;
        }
        a3[1] = length;
      }
      uint64_t v13 = v8[2];
      v8 += 3;
    }
    while (v13);
  }
  else
  {
    uint64_t v7 = 0;
  }
  BOOL v14 = v7 == 1;
  if (v5)
  {
    if ([v5 integerValue] == 1 && v7 != 1) {
      return 4;
    }
  }
  return v14;
}

- (uint64_t)writeTextFlow:(uint64_t)result
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    snprintf(__str, 0x32uLL, "\\stextflow%ld ", a2);
    return [*(id *)(v2 + 8) appendBytes:__str length:strlen(__str)];
  }
  return result;
}

- (uint64_t)_markerStringAtCharacterIndex:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v10 = 0;
    unsigned int v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = __Block_byref_object_copy__17;
    BOOL v14 = __Block_byref_object_dispose__17;
    uint64_t v15 = 0;
    uint64_t v4 = *(void **)(a1 + 240);
    if (!v4)
    {
      uint64_t v5 = objc_alloc_init(NSTextContentStorage);
      *(void *)(v2 + 240) = v5;
      [(NSTextContentStorage *)v5 setAttributedString:*(void *)(v2 + 16)];
      uint64_t v4 = *(void **)(v2 + 240);
    }
    uint64_t v6 = objc_msgSend(v4, "locationFromLocation:withOffset:", objc_msgSend((id)objc_msgSend(v4, "documentRange"), "location"), a2);
    if (v6)
    {
      uint64_t v7 = *(void **)(v2 + 240);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__NSRTFWriter__markerStringAtCharacterIndex___block_invoke;
      v9[3] = &unk_1E55C6280;
      v9[4] = &v10;
      [v7 enumerateTextElementsFromLocation:v6 options:0 usingBlock:v9];
    }
    uint64_t v2 = v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

uint64_t __45__NSRTFWriter__markerStringAtCharacterIndex___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 contentsOnly]) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "markerAttributedString"), "string");
  }
  return 0;
}

@end