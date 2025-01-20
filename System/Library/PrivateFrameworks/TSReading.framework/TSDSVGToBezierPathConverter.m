@interface TSDSVGToBezierPathConverter
+ (CGAffineTransform)transformFromSVGTransformAttributeString:(SEL)a3;
+ (CGPath)newPathFromSVGPathString:(id)a3;
+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4;
+ (CGPath)newPathFromSVGPolygonString:(id)a3;
+ (CGPath)newPathFromSVGPolylineString:(id)a3;
- (id)bezierPathFromSVGData:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation TSDSVGToBezierPathConverter

- (id)bezierPathFromSVGData:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(TSDBezierPath);
  mFileBezierPath = self->mFileBezierPath;
  self->mFileBezierPath = v5;

  mHiddenOnTag = self->mHiddenOnTag;
  self->mHiddenOnTag = 0;

  v8 = (_OWORD *)MEMORY[0x263F000D0];
  self->mHiddenOnTagNestedCount = 0;
  long long v9 = v8[1];
  *(_OWORD *)&self->mGroupedAffineTransform.a = *v8;
  *(_OWORD *)&self->mGroupedAffineTransform.c = v9;
  *(_OWORD *)&self->mGroupedAffineTransform.tx = v8[2];
  self->mGroupedAffineTransformNestedCount = 0;
  self->mViewBoxFound = 0;
  CGSize v10 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mViewBox.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mViewBox.size = v10;
  self->mUsesEvenOdd = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F08D58]) initWithData:v4];

  [v11 setDelegate:self];
  if ([v11 parse]
    && ([v11 parserError], v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    if (self->mViewBoxFound)
    {
      v20 = CGPathCreateWithRect(self->mViewBox, 0);
      v21 = +[TSDBezierPath bezierPathWithCGPath:v20];
      CGPathRelease(v20);
      v25[0] = self->mFileBezierPath;
      v25[1] = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      v23 = +[TSDBezierPath intersectBezierPaths:v22];

      v24 = self->mFileBezierPath;
      self->mFileBezierPath = v23;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F7C7F0] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter bezierPathFromSVGData:]"];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:62 description:@"Unable to Parse SVG File"];

    v16 = objc_alloc_init(TSDBezierPath);
    v17 = self->mFileBezierPath;
    self->mFileBezierPath = v16;
  }
  v18 = self->mFileBezierPath;

  return v18;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a7;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"style"];
  v168 = (void *)v11;
  if (v11)
  {
    v12 = (void *)v11;
    v164 = self;
    id v166 = v9;
    v163 = v10;
    id v10 = (id)[v10 mutableCopy];
    v13 = [v12 componentsSeparatedByString:@";"];
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v174 objects:v179 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v175;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v175 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v174 + 1) + 8 * i);
          if ([v18 length])
          {
            v19 = v10;
            v20 = [v18 componentsSeparatedByString:@":"];
            if ([v20 count] != 2)
            {
              v21 = [MEMORY[0x263F7C7F0] currentHandler];
              v22 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
              v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
              [v21 handleFailureInFunction:v22 file:v23 lineNumber:90 description:@"Style components in SVG <style> tag should have one key and one value."];
            }
            v24 = [MEMORY[0x263F08708] whitespaceCharacterSet];
            v25 = [v20 objectAtIndexedSubscript:0];
            v26 = [v25 stringByTrimmingCharactersInSet:v24];

            v27 = [v20 objectAtIndexedSubscript:1];
            v28 = [v27 stringByTrimmingCharactersInSet:v24];

            id v10 = v19;
            [v19 setObject:v28 forKeyedSubscript:v26];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v174 objects:v179 count:16];
      }
      while (v15);
    }

    self = v164;
    id v9 = v166;
  }
  if ([v9 isEqualToString:@"svg"])
  {
    v29 = [v10 objectForKeyedSubscript:@"preserveAspectRatio"];
    v30 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v31 = [v29 componentsSeparatedByCharactersInSet:v30];

    if (![v31 count])
    {
LABEL_26:
      v41 = [v10 objectForKeyedSubscript:@"viewBox"];
      v42 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v37 = [v41 componentsSeparatedByCharactersInSet:v42];

      if ([v37 count] == 4)
      {
        self->mViewBoxFound = 1;
        v43 = [v37 objectAtIndexedSubscript:0];
        [v43 doubleValue];
        CGFloat v45 = v44;
        v46 = [v37 objectAtIndexedSubscript:1];
        [v46 doubleValue];
        CGFloat v48 = v47;
        v49 = [v37 objectAtIndexedSubscript:2];
        [v49 doubleValue];
        CGFloat v51 = v50;
        v52 = [v37 objectAtIndexedSubscript:3];
        [v52 doubleValue];
        self->mViewBox.origin.x = v45;
        self->mViewBox.origin.y = v48;
        self->mViewBox.size.width = v51;
        self->mViewBox.size.height = v53;
      }
      else
      {
        v43 = [MEMORY[0x263F7C7F0] currentHandler];
        v46 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
        v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v46, v49, 132, @"Unexpected number of viewBox components! (%zu)", objc_msgSend(v37, "count"));
      }

      goto LABEL_30;
    }
    v32 = [v31 objectAtIndexedSubscript:0];
    int v33 = [v32 isEqualToString:@"defer"];

    if (v33)
    {
      v34 = [MEMORY[0x263F7C7F0] currentHandler];
      v35 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
      [v34 handleFailureInFunction:v35 file:v36 lineNumber:111 description:@"Unexpected 'defer' component"];
    }
    if ([v31 count] == 1) {
      goto LABEL_31;
    }
    if ([v31 count] == 2)
    {
      v37 = [v31 objectAtIndexedSubscript:1];
      if ([v37 isEqualToString:@"meet"])
      {
LABEL_30:

LABEL_31:
        v54 = [v10 objectForKeyedSubscript:@"style"];
        if (v54)
        {
          id v173 = 0;
          v55 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"fill-rule:[ \t]*evenodd" options:1 error:&v173];
          id v56 = v173;
          v57 = objc_msgSend(v55, "matchesInString:options:range:", v54, 0, 0, objc_msgSend(v54, "length"));
          if ([v57 count]) {
            self->mUsesEvenOdd = 1;
          }
        }
        goto LABEL_36;
      }
      if ([v37 isEqualToString:@"slice"]) {
        goto LABEL_25;
      }
      v38 = [MEMORY[0x263F7C7F0] currentHandler];
      v39 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
      [v38 handleFailureInFunction:v39, v40, 119, @"Unknown component %@", v37 file lineNumber description];
    }
    else
    {
      v37 = [MEMORY[0x263F7C7F0] currentHandler];
      v38 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 122, @"Unexpected number of preserveAspectRatio components! (%zu)", objc_msgSend(v31, "count"));
    }

LABEL_25:
    goto LABEL_26;
  }
LABEL_36:
  v58 = v168;
  if ([(NSString *)self->mHiddenOnTag isEqualToString:v9]) {
    ++self->mHiddenOnTagNestedCount;
  }
  if (!self->mHiddenOnTag)
  {
    v59 = [v10 objectForKeyedSubscript:@"display"];
    if ([v59 isEqualToString:@"none"])
    {

LABEL_42:
      v61 = (NSString *)[v9 copy];
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = v61;

      goto LABEL_82;
    }
    char v60 = [v9 isEqualToString:@"pattern"];

    if (v60) {
      goto LABEL_42;
    }
    int v63 = [v9 isEqualToString:@"g"];
    v64 = (_OWORD *)MEMORY[0x263F000D0];
    if (v63)
    {
      long long v65 = *(_OWORD *)&self->mGroupedAffineTransform.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
      *(_OWORD *)&t1.c = v65;
      *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
      long long v66 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&t2.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&t2.c = v66;
      *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        v67 = [v10 objectForKeyedSubscript:@"transform"];

        if (v67)
        {
          v68 = [v10 objectForKeyedSubscript:@"transform"];
          +[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:v68];
          long long v69 = *(_OWORD *)&t1.c;
          *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&t1.a;
          *(_OWORD *)&self->mGroupedAffineTransform.c = v69;
          *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&t1.tx;
        }
      }
      else
      {
        ++self->mGroupedAffineTransformNestedCount;
      }
    }
    int v70 = [v9 isEqualToString:@"line"];
    if ([v9 isEqualToString:@"path"])
    {
      v71 = [v10 objectForKeyedSubscript:@"d"];
      v72 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:v71 shouldClosePathAtEnd:v70 ^ 1u];
    }
    else
    {
      if (![v9 isEqualToString:@"polyline"])
      {
        if ([v9 isEqualToString:@"polygon"])
        {
          v102 = [v10 objectForKeyedSubscript:@"points"];
          Mutable = +[TSDSVGToBezierPathConverter newPathFromSVGPolygonString:v102];

          if (!v70) {
            goto LABEL_69;
          }
        }
        else
        {
          if (!v70)
          {
            if ([v9 isEqualToString:@"rect"])
            {
              v113 = [v10 objectForKeyedSubscript:@"width"];
              [v113 floatValue];
              v114 = [v10 objectForKeyedSubscript:@"height"];
              [v114 floatValue];

              memset(&t1, 0, sizeof(t1));
              v115 = [v10 objectForKeyedSubscript:@"x"];
              [v115 floatValue];
              CGFloat v117 = v116;
              v118 = [v10 objectForKeyedSubscript:@"y"];
              [v118 floatValue];
              CGAffineTransformMakeTranslation(&t1, v117, v119);

              double v120 = TSDRectWithSize();
              CGFloat v122 = v121;
              CGFloat v124 = v123;
              CGFloat v126 = v125;
              v127 = [v10 objectForKeyedSubscript:@"rx"];
              [v127 floatValue];
              v129 = TSDCreateRoundRectPathForRectWithRadius(v120, v122, v124, v126, v128);

              Mutable = (CGPath *)MEMORY[0x223CB7D50](v129, &t1);
              CGPathRelease(v129);
              goto LABEL_69;
            }
            if ([v9 isEqualToString:@"circle"])
            {
              v130 = [v10 objectForKeyedSubscript:@"r"];
              [v130 floatValue];
              double v132 = v131;

              v133 = [v10 objectForKeyedSubscript:@"cx"];
              [v133 floatValue];
              double v135 = v134 - v132;

              v136 = [v10 objectForKeyedSubscript:@"cy"];
              [v136 floatValue];
              double v138 = v137 - v132;

              double v139 = v132 + v132;
              double v140 = v135;
              double v141 = v138;
              double v142 = v132 + v132;
            }
            else
            {
              if (![v9 isEqualToString:@"ellipse"])
              {
                Mutable = CGPathCreateMutable();
                goto LABEL_69;
              }
              v150 = [v10 objectForKeyedSubscript:@"rx"];
              [v150 floatValue];
              double v152 = v151;

              v153 = [v10 objectForKeyedSubscript:@"ry"];
              [v153 floatValue];
              double v155 = v154;

              v156 = [v10 objectForKeyedSubscript:@"cx"];
              [v156 floatValue];
              double v158 = v157 - v152;

              v159 = [v10 objectForKeyedSubscript:@"cy"];
              [v159 floatValue];
              double v161 = v160 - v155;

              double v139 = v152 + v152;
              double v142 = v155 + v155;
              double v140 = v158;
              double v141 = v161;
            }
            v162 = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v140, v141, v139, v142);
            Mutable = (CGPath *)[v162 CGPath];

            CGPathRetain(Mutable);
            goto LABEL_69;
          }
          Mutable = CGPathCreateMutable();
          v103 = [v10 objectForKeyedSubscript:@"x1"];
          [v103 floatValue];
          CGFloat v105 = v104;
          v106 = [v10 objectForKeyedSubscript:@"y1"];
          [v106 floatValue];
          CGPathMoveToPoint(Mutable, 0, v105, v107);

          v108 = [v10 objectForKeyedSubscript:@"x2"];
          [v108 floatValue];
          CGFloat v110 = v109;
          v111 = [v10 objectForKeyedSubscript:@"y2"];
          [v111 floatValue];
          CGPathAddLineToPoint(Mutable, 0, v110, v112);
        }
LABEL_53:
        id v167 = v9;
        v74 = [v10 objectForKeyedSubscript:@"stroke-width"];
        v75 = [v10 objectForKeyedSubscript:@"stroke-linecap"];
        v76 = [v10 objectForKeyedSubscript:@"stroke-linejoin"];
        v77 = [v10 objectForKeyedSubscript:@"stroke-miterlimit"];
        double v78 = 1.0;
        if (v74 && ([v74 isEqualToString:&stru_26D688A48] & 1) == 0)
        {
          [v74 floatValue];
          double v78 = v79;
        }
        if (v75
          && ([v75 isEqualToString:&stru_26D688A48] & 1) == 0
          && ([v75 isEqualToString:@"butt"] & 1) == 0)
        {
          if ([v75 isEqualToString:@"round"])
          {
            uint64_t v80 = 1;
            goto LABEL_60;
          }
          if ([v75 isEqualToString:@"square"])
          {
            uint64_t v80 = 2;
            goto LABEL_60;
          }
          v143 = [MEMORY[0x263F7C7F0] currentHandler];
          id v144 = v10;
          v145 = self;
          v146 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
          v147 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
          [v143 handleFailureInFunction:v146, v147, 242, @"Unexpected Line Cap Style: %@", v75 file lineNumber description];

          self = v145;
          id v10 = v144;
        }
        uint64_t v80 = 0;
LABEL_60:
        if (!v76
          || ([v76 isEqualToString:&stru_26D688A48] & 1) != 0
          || ([v76 isEqualToString:@"miter"] & 1) != 0)
        {
          id v81 = v10;
          v82 = self;
LABEL_64:
          uint64_t v83 = 0;
          goto LABEL_65;
        }
        id v81 = v10;
        v82 = self;
        if ([v75 isEqualToString:@"round"])
        {
          uint64_t v83 = 1;
        }
        else
        {
          if (([v75 isEqualToString:@"bevel"] & 1) == 0)
          {
            v165 = [MEMORY[0x263F7C7F0] currentHandler];
            v148 = [NSString stringWithUTF8String:"-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"];
            v149 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
            [v165 handleFailureInFunction:v148, v149, 254, @"Unexpected Line Join Style: %@", v76 file lineNumber description];

            goto LABEL_64;
          }
          uint64_t v83 = 2;
        }
LABEL_65:
        v84 = +[TSDBezierPath bezierPathWithCGPath:Mutable];
        [v84 setLineWidth:v78];
        [v84 setLineCapStyle:v80];
        [v84 setLineJoinStyle:v83];
        if (v77 && ([v77 isEqualToString:&stru_26D688A48] & 1) == 0)
        {
          [v77 floatValue];
          [v84 setMiterLimit:v85];
        }
        v86 = [v84 outlineStroke];
        Mutable = (CGPath *)[v86 CGPath];

        CGPathRetain(Mutable);
        id v9 = v167;
        v58 = v168;
        self = v82;
        id v10 = v81;
        v64 = (_OWORD *)MEMORY[0x263F000D0];
LABEL_69:
        long long v87 = *(_OWORD *)&self->mGroupedAffineTransform.c;
        *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
        *(_OWORD *)&t1.c = v87;
        *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
        v88 = [v10 objectForKeyedSubscript:@"transform"];

        if (v88)
        {
          memset(&t2, 0, sizeof(t2));
          v89 = [v10 objectForKeyedSubscript:@"transform"];
          +[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:v89];

          CGAffineTransform v170 = t1;
          CGAffineTransform v169 = t2;
          CGAffineTransformConcat(&t1, &v170, &v169);
        }
        CGAffineTransform t2 = t1;
        long long v90 = v64[1];
        *(_OWORD *)&v170.a = *v64;
        *(_OWORD *)&v170.c = v90;
        *(_OWORD *)&v170.tx = v64[2];
        if (!CGAffineTransformEqualToTransform(&t2, &v170))
        {
          uint64_t v91 = MEMORY[0x223CB7D50](Mutable, &t1);
          CGPathRelease(Mutable);
          Mutable = (CGPath *)v91;
        }
        v92 = +[TSDBezierPath bezierPathWithCGPath:Mutable];
        [v92 setWindingRule:self->mUsesEvenOdd];
        CGPathRelease(Mutable);
        mFileBezierPath = self->mFileBezierPath;
        p_mFileBezierPath = &self->mFileBezierPath;
        v178[0] = mFileBezierPath;
        v178[1] = v92;
        v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v178 count:2];
        v96 = +[TSDBezierPath uniteBezierPaths:v95];

        if ([v96 isEmpty])
        {
          if ([v92 isEmpty]) {
            goto LABEL_81;
          }
          [v92 controlPointBounds];
          if (v98 <= 1.0) {
            goto LABEL_81;
          }
          v99 = v92;
          if (v97 <= 1.0) {
            goto LABEL_81;
          }
        }
        else
        {
          [v96 controlPointBounds];
          if (v101 <= 1.0) {
            goto LABEL_81;
          }
          v99 = v96;
          if (v100 <= 1.0) {
            goto LABEL_81;
          }
        }
        objc_storeStrong((id *)p_mFileBezierPath, v99);
LABEL_81:

        goto LABEL_82;
      }
      v71 = [v10 objectForKeyedSubscript:@"points"];
      v72 = +[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:v71];
    }
    Mutable = v72;

    if ((v70 & 1) == 0) {
      goto LABEL_69;
    }
    goto LABEL_53;
  }
LABEL_82:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v7 = a4;
  if ([(NSString *)self->mHiddenOnTag isEqualToString:v7])
  {
    unint64_t mHiddenOnTagNestedCount = self->mHiddenOnTagNestedCount;
    if (mHiddenOnTagNestedCount)
    {
      self->unint64_t mHiddenOnTagNestedCount = mHiddenOnTagNestedCount - 1;
    }
    else
    {
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = 0;
    }
  }
  if ([v7 isEqualToString:@"g"])
  {
    long long v10 = *(_OWORD *)&self->mGroupedAffineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v15 = *MEMORY[0x263F000D0];
    *(_OWORD *)&t2.a = *MEMORY[0x263F000D0];
    long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v14 = v11;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = v13;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      unint64_t mGroupedAffineTransformNestedCount = self->mGroupedAffineTransformNestedCount;
      if (mGroupedAffineTransformNestedCount)
      {
        self->unint64_t mGroupedAffineTransformNestedCount = mGroupedAffineTransformNestedCount - 1;
      }
      else
      {
        *(_OWORD *)&self->mGroupedAffineTransform.a = v15;
        *(_OWORD *)&self->mGroupedAffineTransform.c = v14;
        *(_OWORD *)&self->mGroupedAffineTransform.tx = v13;
      }
    }
  }
}

+ (CGPath)newPathFromSVGPathString:(id)a3
{
  return +[TSDSVGToBezierPathConverter newPathFromSVGPathString:a3 shouldClosePathAtEnd:0];
}

+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4
{
  BOOL v59 = a4;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  Mutable = CGPathCreateMutable();
  v6 = (double *)MEMORY[0x263F00148];
  long long v65 = *MEMORY[0x263F00148];
  *(_OWORD *)y = *MEMORY[0x263F00148];
  char v60 = v4;
  id v7 = [MEMORY[0x263F08B08] scannerWithString:v4];
  uint64_t v75 = *(void *)asc_22383A988;
  int v76 = 2883717;
  v8 = (void *)MEMORY[0x263F08708];
  id v9 = [NSString stringWithCharacters:&v75 length:6];
  long long v10 = [v8 characterSetWithCharactersInString:v9];
  [v7 setCharactersToBeSkipped:v10];

  if (([v7 isAtEnd] & 1) == 0)
  {
    unsigned __int16 v18 = 0;
    id v12 = 0;
    double v19 = *v6;
    double v20 = v6[1];
    double v63 = v20;
    double v64 = *v6;
    double v21 = *v6;
    double v22 = v20;
    while (1)
    {
      v23 = v12;
      v24 = [MEMORY[0x263F08708] letterCharacterSet];
      id v73 = v12;
      int v25 = [v7 scanCharactersFromSet:v24 intoString:&v73];
      id v12 = v73;

      if (v25) {
        objc_msgSend(v7, "setScanLocation:", objc_msgSend(v7, "scanLocation") - objc_msgSend(v12, "length") + 1);
      }
      uint64_t v13 = [v12 characterAtIndex:0];
      double v26 = v20;
      double x = v19;
      if (!CGPathIsEmpty(Mutable))
      {
        CGPoint CurrentPoint = CGPathGetCurrentPoint(Mutable);
        double x = CurrentPoint.x;
        double v26 = CurrentPoint.y;
      }
      v29 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
      int v30 = [v29 characterIsMember:v13];

      double v31 = v20;
      double v32 = v19;
      if (v30)
      {
        CGPoint v33 = CGPathGetCurrentPoint(Mutable);
        double v32 = v33.x;
        double v31 = v33.y;
      }
      if ((int)v13 <= 96)
      {
        switch((int)v13)
        {
          case 'A':
            goto LABEL_18;
          case 'B':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'I':
          case 'J':
          case 'K':
          case 'N':
          case 'O':
          case 'P':
          case 'R':
          case 'U':
            goto LABEL_92;
          case 'C':
            goto LABEL_26;
          case 'H':
            goto LABEL_33;
          case 'L':
            goto LABEL_34;
          case 'M':
            goto LABEL_40;
          case 'Q':
            goto LABEL_42;
          case 'S':
            goto LABEL_47;
          case 'T':
            goto LABEL_58;
          case 'V':
            goto LABEL_68;
          default:
            if (v13 != 90) {
              goto LABEL_92;
            }
            goto LABEL_72;
        }
      }
      switch((int)v13)
      {
        case 'a':
LABEL_18:
          v68[0] = 0.0;
          *(void *)&long long v67 = 0;
          *(void *)&long long v66 = 0;
          uint64_t v71 = 0;
          uint64_t v72 = 0;
          double v69 = 0.0;
          double v70 = 0.0;
          int v34 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v34)
          {
            int v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
            if (v34)
            {
              int v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v66);
              if (v34)
              {
                int v34 = [v7 scanInteger:&v72];
                if (v34)
                {
                  int v34 = [v7 scanInteger:&v71];
                  if (v34)
                  {
                    int v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v70);
                    if (v34) {
                      int v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v69);
                    }
                  }
                }
              }
            }
          }
          int v11 = v34 ^ 1;
          double v69 = v31 + v69;
          double v70 = v32 + v70;
          v35 = TSDCreatePathByComputingArc(v72 != 0, v71 != 0, x, v26, v68[0], *(double *)&v67, *(long double *)&v66, v70, v69);
          uint64_t ElementCount = TSDPathGetElementCount(v35);
          v37 = TSDCreatePathByAppendingPathFromElementToElement(Mutable, v35, 1, ElementCount);
          CGPathRelease(v35);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v37);
          CGPathRelease(v37);
          goto LABEL_86;
        case 'b':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'i':
        case 'j':
        case 'k':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 'u':
          goto LABEL_92;
        case 'c':
LABEL_26:
          long long v67 = v65;
          *(_OWORD *)v68 = v65;
          long long v66 = v65;
          int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v38)
          {
            int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v38)
            {
              int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v38)
              {
                int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
                if (v38)
                {
                  int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v66);
                  if (v38) {
                    int v38 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v66 + 8);
                  }
                }
              }
            }
          }
          int v11 = v38 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&long long v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          *(double *)&long long v66 = v32 + *(double *)&v66;
          *((double *)&v66 + 1) = v31 + *((double *)&v66 + 1);
          CGPathAddCurveToPoint(Mutable, 0, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1), *(CGFloat *)&v66, *((CGFloat *)&v66 + 1));
          double v63 = *((double *)&v67 + 1);
          double v64 = *(double *)&v67;
          goto LABEL_86;
        case 'h':
LABEL_33:
          int v11 = objc_msgSend(v7, "tsu_scanCGFloat:", y) ^ 1;
          double v39 = v32 + y[0];
          v40 = Mutable;
          double v41 = v26;
          goto LABEL_76;
        case 'l':
LABEL_34:
          int v42 = objc_msgSend(v7, "tsu_scanCGFloat:", y);
          if (v42) {
            int v42 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
          }
          int v11 = v42 ^ 1;
          if (v30)
          {
            if (y[0] == v19 && y[1] == v20) {
              goto LABEL_86;
            }
          }
          else if (y[0] == x && y[1] == v26)
          {
            goto LABEL_86;
          }
          double v39 = v32 + y[0];
          double v41 = v31 + y[1];
          v40 = Mutable;
LABEL_76:
          CGPathAddLineToPoint(v40, 0, v39, v41);
          goto LABEL_86;
        case 'm':
LABEL_40:
          if (objc_msgSend(v7, "tsu_scanCGFloat:", y)) {
            int v43 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
          }
          else {
            int v43 = 0;
          }
          uint64_t v51 = TSDPathGetElementCount(Mutable);
          double v52 = y[0];
          if (v51 < 1)
          {
            double v53 = y[1];
          }
          else
          {
            double v52 = v32 + y[0];
            double v53 = v31 + y[1];
          }
          CGPathMoveToPoint(Mutable, 0, v52, v53);
          if (objc_msgSend(v7, "tsu_scanCGFloat:", y))
          {
            do
            {
              int v43 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
              if (v30)
              {
                CGPoint v54 = CGPathGetCurrentPoint(Mutable);
                double v32 = v54.x;
                double v31 = v54.y;
              }
              CGPathAddLineToPoint(Mutable, 0, v32 + y[0], v31 + y[1]);
            }
            while ((objc_msgSend(v7, "tsu_scanCGFloat:", y) & 1) != 0);
          }
          int v11 = v43 ^ 1;
          goto LABEL_86;
        case 'q':
LABEL_42:
          long long v67 = v65;
          *(_OWORD *)v68 = v65;
          int v44 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v44)
          {
            int v44 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v44)
            {
              int v44 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v44) {
                int v44 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
              }
            }
          }
          int v11 = v44 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&long long v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          CGPathAddQuadCurveToPoint(Mutable, 0, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1));
          double v22 = v68[1];
          double v21 = v68[0];
          goto LABEL_86;
        case 's':
LABEL_47:
          double v61 = v22;
          double v62 = v21;
          __int16 v45 = (unsigned __int16)(v18 - 67) >> 4;
          if (v45 & 0xFFFC | (unsigned __int16)((v18 - 67) << 12)) {
            double v46 = -0.0;
          }
          else {
            double v46 = x - v64;
          }
          if (v45 & 0xFFFC | (unsigned __int16)((v18 - 67) << 12)) {
            double v47 = -0.0;
          }
          else {
            double v47 = v26 - v63;
          }
          long long v67 = v65;
          *(_OWORD *)v68 = v65;
          int v48 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v48)
          {
            int v48 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v48)
            {
              int v48 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v48) {
                int v48 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
              }
            }
          }
          int v11 = v48 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&long long v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          CGPathAddCurveToPoint(Mutable, 0, x + v46, v26 + v47, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1));
          double v63 = v68[1];
          double v64 = v68[0];
          double v22 = v61;
          double v21 = v62;
          goto LABEL_86;
        case 't':
LABEL_58:
          if (v18 - 81 > 0x23)
          {
            double v21 = x;
            double v22 = v26;
          }
          else
          {
            uint64_t v49 = 1 << (v18 - 81);
            if ((v49 & 0x900000009) != 0) {
              double v21 = x + x - v21;
            }
            else {
              double v21 = x;
            }
            if ((v49 & 0x900000009) != 0) {
              double v22 = v26 + v26 - v22;
            }
            else {
              double v22 = v26;
            }
          }
          *(_OWORD *)v68 = 0uLL;
          int v50 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v50) {
            int v50 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
          }
          int v11 = v50 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          CGPathAddQuadCurveToPoint(Mutable, 0, v21, v22, v68[0], v68[1]);
          goto LABEL_86;
        case 'v':
LABEL_68:
          int v11 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]) ^ 1;
          double v41 = v31 + y[1];
          v40 = Mutable;
          double v39 = x;
          goto LABEL_76;
        default:
          if (v13 != 122)
          {
LABEL_92:
            id v56 = [MEMORY[0x263F7C7F0] currentHandler];
            v57 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]"];
            v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
            [v56 handleFailureInFunction:v57, v58, 570, @"Cannot process path of type %@", v12 file lineNumber description];

            [v7 isAtEnd];
            int v11 = 1;
            goto LABEL_3;
          }
LABEL_72:
          CGPathCloseSubpath(Mutable);
          int v11 = 0;
LABEL_86:
          if ([v7 isAtEnd]) {
            goto LABEL_3;
          }
          unsigned __int16 v18 = v13;
          if (v11) {
            goto LABEL_3;
          }
          break;
      }
    }
  }
  int v11 = 0;
  id v12 = 0;
  uint64_t v13 = 0;
LABEL_3:
  if (v59 && (v13 | 0x20) != 0x7A)
  {
    MutableCopy = CGPathCreateMutableCopy(Mutable);
    CGPathRelease(Mutable);
    CGPathCloseSubpath(MutableCopy);
    Mutable = MutableCopy;
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    long long v14 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v15 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]"];
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 590, @"Bailing on operation %c", v13);
  }
LABEL_7:

  return Mutable;
}

+ (CGPath)newPathFromSVGPolylineString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  *(_OWORD *)uint64_t v13 = *MEMORY[0x263F00148];
  v5 = [MEMORY[0x263F08B08] scannerWithString:v3];
  uint64_t v14 = *(void *)asc_22383A988;
  int v15 = 2883717;
  v6 = (void *)MEMORY[0x263F08708];
  id v7 = [NSString stringWithCharacters:&v14 length:6];
  v8 = [v6 characterSetWithCharactersInString:v7];
  [v5 setCharactersToBeSkipped:v8];

  if (objc_msgSend(v5, "tsu_scanCGFloat:", v13)
    && (objc_msgSend(v5, "tsu_scanCGFloat:", &v13[1]) & 1) != 0)
  {
    CGPathMoveToPoint(Mutable, 0, v13[0], v13[1]);
    if (([v5 isAtEnd] & 1) == 0)
    {
      while (objc_msgSend(v5, "tsu_scanCGFloat:", v13)
           && (objc_msgSend(v5, "tsu_scanCGFloat:", &v13[1]) & 1) != 0)
      {
        CGPathAddLineToPoint(Mutable, 0, v13[0], v13[1]);
        if ([v5 isAtEnd]) {
          goto LABEL_10;
        }
      }
      [v5 isAtEnd];
    }
LABEL_10:
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    id v9 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v10 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:]"];
    int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:607 description:@"No value for initial polyline point!"];
  }
  return Mutable;
}

+ (CGPath)newPathFromSVGPolygonString:(id)a3
{
  id v3 = +[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:a3];
  MutableCopy = CGPathCreateMutableCopy(v3);
  CGPathRelease(v3);
  CGPathCloseSubpath(MutableCopy);
  return MutableCopy;
}

+ (CGAffineTransform)transformFromSVGTransformAttributeString:(SEL)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v87 = 0;
  v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(matrix|translate|scale|rotate)\\((.*?)\\)" options:1 error:&v87];
  id v68 = v87;
  double v69 = v6;
  id v7 = objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v8 = (double *)MEMORY[0x263F000D0];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->double a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->double c = v9;
  *(_OWORD *)&retstr->tdouble x = *((_OWORD *)v8 + 2);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v7;
  uint64_t v77 = [v7 countByEnumeratingWithState:&v83 objects:v90 count:16];
  if (v77)
  {
    double v74 = v8[1];
    double v75 = *v8;
    double v10 = v8[4];
    double v72 = v8[3];
    double v73 = v8[2];
    double v11 = v8[5];
    uint64_t v76 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v77; uint64_t i = v50 + 1)
      {
        if (*(void *)v84 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v79 = i;
        uint64_t v13 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        uint64_t v14 = [v13 rangeAtIndex:1];
        uint64_t v80 = objc_msgSend(v5, "substringWithRange:", v14, v15);
        uint64_t v16 = [v13 rangeAtIndex:2];
        double v78 = objc_msgSend(v5, "substringWithRange:", v16, v17);
        unsigned __int16 v18 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:");
        uint64_t v88 = *(void *)asc_22383A988;
        int v89 = 2883717;
        double v19 = (void *)MEMORY[0x263F08708];
        double v20 = [NSString stringWithCharacters:&v88 length:6];
        double v21 = [v19 characterSetWithCharactersInString:v20];
        [v18 setCharactersToBeSkipped:v21];

        double v22 = [MEMORY[0x263EFF980] array];
        if (([v18 isAtEnd] & 1) == 0)
        {
          unint64_t v23 = 1;
          do
          {
            t1.double a = 0.0;
            char v24 = objc_msgSend(v18, "tsu_scanCGFloat:", &t1);
            HIDWORD(v25) = HIDWORD(t1.a);
            *(float *)&double v25 = t1.a;
            double v26 = [NSNumber numberWithFloat:v25];
            [v22 addObject:v26];
            if (v23 >= 7)
            {
              v27 = [MEMORY[0x263F7C7F0] currentHandler];
              v28 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
              v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
              [v27 handleFailureInFunction:v28, v29, 676, @"Too many numbers for transform %@", v5 file lineNumber description];

              char v24 = 0;
            }

            if ([v18 isAtEnd]) {
              break;
            }
            ++v23;
          }
          while ((v24 & 1) != 0);
        }
        int v30 = v80;
        if ([v80 isEqualToString:@"matrix"])
        {
          if ([v22 count] == 6)
          {
            double v31 = [v22 objectAtIndexedSubscript:0];
            [v31 floatValue];
            double a = v32;
            double v70 = [v22 objectAtIndexedSubscript:1];
            [v70 floatValue];
            double b = v34;
            v36 = [v22 objectAtIndexedSubscript:2];
            [v36 floatValue];
            double c = v37;
            double v39 = [v22 objectAtIndexedSubscript:3];
            [v39 floatValue];
            double d = v40;
            int v42 = [v22 objectAtIndexedSubscript:4];
            [v42 floatValue];
            tdouble x = v43;
            [v22 objectAtIndexedSubscript:5];
            v46 = __int16 v45 = retstr;
            [v46 floatValue];
            double ty = v47;

            retstr = v45;
            uint64_t v49 = v31;
          }
          else
          {
            uint64_t v49 = [MEMORY[0x263F7C7F0] currentHandler];
            v55 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
            id v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
            [v49 handleFailureInFunction:v55, v56, 694, @"Not enough numbers for matrix transform! %@", v5 file lineNumber description];

            double ty = v11;
            tdouble x = v10;
            double d = v72;
            double c = v73;
            double b = v74;
            double a = v75;
          }
          uint64_t v50 = v79;
          int v30 = v80;
          goto LABEL_32;
        }
        uint64_t v50 = v79;
        if (![v80 isEqualToString:@"translate"])
        {
          double ty = v11;
          tdouble x = v10;
          double d = v72;
          double c = v73;
          double b = v74;
          double a = v75;
          if (![v80 isEqualToString:@"scale"]) {
            goto LABEL_33;
          }
          if ([v22 count] == 2)
          {
            uint64_t v49 = [v22 objectAtIndexedSubscript:0];
            [v49 floatValue];
            double v58 = v57;
            BOOL v59 = v22;
            uint64_t v60 = 1;
          }
          else
          {
            if ([v22 count] != 1)
            {
              uint64_t v49 = [MEMORY[0x263F7C7F0] currentHandler];
              double v64 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
              long long v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
              [v49 handleFailureInFunction:v64, v65, 715, @"Wrong number of numbers for scale transform! %@", v5 file lineNumber description];
              goto LABEL_31;
            }
            uint64_t v49 = [v22 objectAtIndexedSubscript:0];
            [v49 floatValue];
            double v58 = v62;
            BOOL v59 = v22;
            uint64_t v60 = 0;
          }
          double v53 = [v59 objectAtIndexedSubscript:v60];
          [v53 floatValue];
          CGAffineTransformMakeScale(&t1, v58, v63);
          goto LABEL_28;
        }
        if ([v22 count] == 2)
        {
          uint64_t v49 = [v22 objectAtIndexedSubscript:0];
          [v49 floatValue];
          CGFloat v52 = v51;
          double v53 = [v22 objectAtIndexedSubscript:1];
          [v53 floatValue];
          CGAffineTransformMakeTranslation(&t1, v52, v54);
LABEL_28:
          double a = t1.a;
          double b = t1.b;
          double c = t1.c;
          double d = t1.d;
          tdouble x = t1.tx;
          double ty = t1.ty;

          goto LABEL_32;
        }
        if ([v22 count] != 1)
        {
          uint64_t v49 = [MEMORY[0x263F7C7F0] currentHandler];
          double v64 = [NSString stringWithUTF8String:"+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
          long long v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m"];
          [v49 handleFailureInFunction:v64, v65, 705, @"Wrong number of numbers for translate transform! %@", v5 file lineNumber description];
LABEL_31:

          int v30 = v80;
          double ty = v11;
          tdouble x = v10;
          double d = v72;
          double c = v73;
          double b = v74;
          double a = v75;
          goto LABEL_32;
        }
        uint64_t v49 = [v22 objectAtIndexedSubscript:0];
        [v49 floatValue];
        CGAffineTransformMakeTranslation(&t1, v61, 0.0);
        double a = t1.a;
        double b = t1.b;
        double c = t1.c;
        double d = t1.d;
        tdouble x = t1.tx;
        double ty = t1.ty;
LABEL_32:

LABEL_33:
        long long v66 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&t1.double a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&t1.double c = v66;
        *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
        t2.double a = a;
        t2.double b = b;
        t2.double c = c;
        t2.double d = d;
        t2.tdouble x = tx;
        t2.double ty = ty;
        CGAffineTransformConcat(retstr, &t1, &t2);
      }
      uint64_t v77 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    }
    while (v77);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHiddenOnTag, 0);

  objc_storeStrong((id *)&self->mFileBezierPath, 0);
}

@end