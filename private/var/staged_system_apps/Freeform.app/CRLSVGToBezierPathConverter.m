@interface CRLSVGToBezierPathConverter
+ (CGAffineTransform)transformFromSVGTransformAttributeString:(SEL)a3;
+ (CGPath)newPathFromSVGPathString:(id)a3;
+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4;
+ (CGPath)newPathFromSVGPolygonString:(id)a3;
+ (CGPath)newPathFromSVGPolylineString:(id)a3;
- (id)bezierPathFromSVGData:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation CRLSVGToBezierPathConverter

- (id)bezierPathFromSVGData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CRLBezierPath);
  mFileBezierPath = self->mFileBezierPath;
  self->mFileBezierPath = v5;

  mHiddenOnTag = self->mHiddenOnTag;
  self->mHiddenOnTag = 0;

  self->mHiddenOnTagNestedCount = 0;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mGroupedAffineTransform.c = v8;
  *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  self->mGroupedAffineTransformNestedCount = 0;
  self->mViewBoxFound = 0;
  CGSize size = CGRectZero.size;
  self->mViewBox.origin = CGRectZero.origin;
  self->mViewBox.CGSize size = size;
  self->mUsesEvenOdd = 0;
  id v10 = [objc_alloc((Class)NSXMLParser) initWithData:v4];

  [v10 setDelegate:self];
  if ([v10 parse]
    && ([v10 parserError], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    if (!self->mViewBoxFound) {
      goto LABEL_13;
    }
    v19 = CGPathCreateWithRect(self->mViewBox, 0);
    v16 = +[CRLBezierPath bezierPathWithCGPath:v19];
    CGPathRelease(v19);
    v23[0] = self->mFileBezierPath;
    v23[1] = v16;
    v20 = +[NSArray arrayWithObjects:v23 count:2];
    v21 = +[CRLBezierPath intersectBezierPaths:v20];

    v22 = self->mFileBezierPath;
    self->mFileBezierPath = v21;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD8C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8C48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD8E8);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8B9C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter bezierPathFromSVGData:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:62 isFatal:0 description:"Unable to Parse SVG File"];

    v15 = objc_alloc_init(CRLBezierPath);
    v16 = self->mFileBezierPath;
    self->mFileBezierPath = v15;
  }

LABEL_13:
  v17 = self->mFileBezierPath;

  return v17;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v182 = a3;
  id v12 = a4;
  id v181 = a5;
  id v180 = a6;
  id v13 = a7;
  uint64_t v14 = [v13 objectForKeyedSubscript:@"style"];
  v183 = (void *)v14;
  if (v14)
  {
    v15 = (void *)v14;
    v176 = v13;
    v178 = self;
    id v175 = v12;
    id v16 = [v13 mutableCopy];
    [v15 componentsSeparatedByString:@";"];
    long long v191 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [v17 countByEnumeratingWithState:&v191 objects:v197 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v192;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v192 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v191 + 1) + 8 * (void)v21);
          if ([v22 length])
          {
            v23 = [v22 componentsSeparatedByString:@":"];
            if ([v23 count] != (id)2)
            {
              unsigned int v24 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FD908);
              }
              v25 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67109890;
                HIDWORD(buf.a) = v24;
                LOWORD(buf.b) = 2082;
                *(void *)((char *)&buf.b + 2) = "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qual"
                                                  "ifiedName:attributes:]";
                WORD1(buf.c) = 2082;
                *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVG"
                                                  "ToBezierPathConverter.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 90;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Style components in SVG <style> tag should have one key and one value.", (uint8_t *)&buf, 0x22u);
              }

              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FD928);
              }
              v26 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
              {
                id v34 = +[CRLAssertionHandler packedBacktraceString];
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v24;
                LOWORD(buf.b) = 2114;
                *(void *)((char *)&buf.b + 2) = v34;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
              }
              v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
              v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
              +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:90 isFatal:0 description:"Style components in SVG <style> tag should have one key and one value."];
            }
            v29 = +[NSCharacterSet whitespaceCharacterSet];
            v30 = [v23 objectAtIndexedSubscript:0];
            v31 = [v30 stringByTrimmingCharactersInSet:v29];

            v32 = [v23 objectAtIndexedSubscript:1];
            v33 = [v32 stringByTrimmingCharactersInSet:v29];

            [v16 setObject:v33 forKeyedSubscript:v31];
          }
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v191 objects:v197 count:16];
      }
      while (v19);
    }

    id v35 = v16;
    id v13 = v35;
    id v12 = v175;
    self = v178;
  }
  if ([v12 isEqualToString:@"svg"])
  {
    v36 = [v13 objectForKeyedSubscript:@"preserveAspectRatio"];
    v37 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    v38 = [v36 componentsSeparatedByCharactersInSet:v37];

    if (![v38 count])
    {
LABEL_58:
      id v45 = v13;
      v53 = [v13 objectForKeyedSubscript:@"viewBox"];
      v54 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      v46 = [v53 componentsSeparatedByCharactersInSet:v54];

      if ([v46 count] == (id)4)
      {
        self->mViewBoxFound = 1;
        v55 = [v46 objectAtIndexedSubscript:0];
        [v55 doubleValue];
        CGFloat v57 = v56;
        v58 = [v46 objectAtIndexedSubscript:1];
        [v58 doubleValue];
        CGFloat v60 = v59;
        v61 = [v46 objectAtIndexedSubscript:2];
        [v61 doubleValue];
        CGFloat v63 = v62;
        v64 = [v46 objectAtIndexedSubscript:3];
        [v64 doubleValue];
        self->mViewBox.origin.x = v57;
        self->mViewBox.origin.y = v60;
        self->mViewBox.size.width = v63;
        self->mViewBox.size.height = v65;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FDA08);
        }
        v66 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR)) {
          sub_1010B8E94(v46);
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FDA28);
        }
        v67 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR)) {
          sub_1010B8CD8();
        }

        v55 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
        v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v58, 132, 0, "Unexpected number of viewBox components! (%zu)", [v46 count]);
      }

      goto LABEL_70;
    }
    v39 = [v38 objectAtIndexedSubscript:0];
    unsigned int v40 = [v39 isEqualToString:@"defer"];

    if (v40)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD948);
      }
      v41 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR)) {
        sub_1010B906C();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD968);
      }
      v42 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
        sub_1010B8CD8();
      }

      v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:v43 file:v44 lineNumber:111 isFatal:0 description:"Unexpected 'defer' component"];
    }
    if ([v38 count] == (id)1) {
      goto LABEL_71;
    }
    if ([v38 count] == (id)2)
    {
      id v45 = v13;
      v46 = [v38 objectAtIndexedSubscript:1];
      if ([v46 isEqualToString:@"meet"])
      {
LABEL_70:

        id v13 = v45;
LABEL_71:
        v68 = [v13 objectForKeyedSubscript:@"style"];
        if (v68)
        {
          id v190 = 0;
          v69 = +[NSRegularExpression regularExpressionWithPattern:@"fill-rule:[ \t]*evenodd" options:1 error:&v190];
          id v70 = v190;
          v71 = [v69 matchesInString:v68 options:0 range:[v68 length]];
          if ([v71 count]) {
            self->mUsesEvenOdd = 1;
          }
        }
        goto LABEL_76;
      }
      if ([v46 isEqualToString:@"slice"]) {
        goto LABEL_57;
      }
      int v184 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD988);
      }
      v47 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR)) {
        sub_1010B8F38((uint64_t)v46, v184);
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD9A8);
      }
      v48 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR)) {
        sub_1010B8CD8();
      }

      v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v50 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:v49, v50, 119, 0, "Unknown component %@", v46 file lineNumber isFatal description];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD9C8);
      }
      v51 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR)) {
        sub_1010B8FC8(v38);
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD9E8);
      }
      id v45 = v13;
      v52 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR)) {
        sub_1010B8CD8();
      }

      v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v49, 122, 0, "Unexpected number of preserveAspectRatio components! (%zu)", [v38 count]);
    }

LABEL_57:
    id v13 = v45;
    goto LABEL_58;
  }
LABEL_76:
  v72 = v183;
  if ([(NSString *)self->mHiddenOnTag isEqualToString:v12]) {
    ++self->mHiddenOnTagNestedCount;
  }
  if (!self->mHiddenOnTag)
  {
    v73 = [v13 objectForKeyedSubscript:@"display"];
    if ([v73 isEqualToString:@"none"])
    {

LABEL_82:
      v75 = (NSString *)[v12 copy];
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = v75;

      goto LABEL_156;
    }
    unsigned __int8 v74 = [v12 isEqualToString:@"pattern"];

    if (v74) {
      goto LABEL_82;
    }
    if ([v12 isEqualToString:@"g"])
    {
      long long v77 = *(_OWORD *)&self->mGroupedAffineTransform.c;
      *(_OWORD *)&buf.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
      *(_OWORD *)&buf.c = v77;
      *(_OWORD *)&buf.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
      long long v78 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&t2.c = v78;
      *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      if (CGAffineTransformEqualToTransform(&buf, &t2))
      {
        v79 = [v13 objectForKeyedSubscript:@"transform"];

        if (v79)
        {
          v80 = [v13 objectForKeyedSubscript:@"transform"];
          +[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:v80];
          long long v81 = *(_OWORD *)&buf.c;
          *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&buf.a;
          *(_OWORD *)&self->mGroupedAffineTransform.c = v81;
          *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&buf.tx;
        }
      }
      else
      {
        ++self->mGroupedAffineTransformNestedCount;
      }
    }
    unsigned int v82 = [v12 isEqualToString:@"line"];
    if ([v12 isEqualToString:@"path"])
    {
      v83 = [v13 objectForKeyedSubscript:@"d"];
      v84 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:v83 shouldClosePathAtEnd:v82 ^ 1];
    }
    else
    {
      if (![v12 isEqualToString:@"polyline"])
      {
        if ([v12 isEqualToString:@"polygon"])
        {
          v93 = [v13 objectForKeyedSubscript:@"points"];
          Mutable = +[CRLSVGToBezierPathConverter newPathFromSVGPolygonString:v93];

          if (!v82) {
            goto LABEL_143;
          }
        }
        else
        {
          if (!v82)
          {
            if ([v12 isEqualToString:@"rect"])
            {
              v104 = [v13 objectForKeyedSubscript:@"width"];
              [v104 floatValue];
              v105 = [v13 objectForKeyedSubscript:@"height"];
              [v105 floatValue];

              memset(&buf, 0, sizeof(buf));
              v106 = [v13 objectForKeyedSubscript:@"x"];
              [v106 floatValue];
              CGFloat v108 = v107;
              v109 = [v13 objectForKeyedSubscript:@"y"];
              [v109 floatValue];
              CGAffineTransformMakeTranslation(&buf, v108, v110);

              double v111 = sub_100064070();
              double v113 = v112;
              double v115 = v114;
              double v117 = v116;
              v118 = [v13 objectForKeyedSubscript:@"rx"];
              [v118 crl_CGFloatValue];
              +[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v111, v113, v115, v117, v119);
              id v120 = objc_claimAutoreleasedReturnValue();
              v121 = CGPathRetain((CGPathRef)[v120 CGPath]);

              Mutable = CGPathCreateCopyByTransformingPath(v121, &buf);
              CGPathRelease(v121);
              goto LABEL_143;
            }
            if ([v12 isEqualToString:@"circle"])
            {
              v122 = [v13 objectForKeyedSubscript:@"r"];
              [v122 floatValue];
              double v124 = v123;

              v125 = [v13 objectForKeyedSubscript:@"cx"];
              [v125 floatValue];
              double v127 = v126 - v124;

              v128 = [v13 objectForKeyedSubscript:@"cy"];
              [v128 floatValue];
              double v130 = v129 - v124;

              double v131 = v124 + v124;
              double v132 = v127;
              double v133 = v130;
              double v134 = v124 + v124;
            }
            else
            {
              if (![v12 isEqualToString:@"ellipse"])
              {
                Mutable = CGPathCreateMutable();
                goto LABEL_143;
              }
              v162 = [v13 objectForKeyedSubscript:@"rx"];
              [v162 floatValue];
              double v164 = v163;

              v165 = [v13 objectForKeyedSubscript:@"ry"];
              [v165 floatValue];
              double v167 = v166;

              v168 = [v13 objectForKeyedSubscript:@"cx"];
              [v168 floatValue];
              double v170 = v169 - v164;

              v171 = [v13 objectForKeyedSubscript:@"cy"];
              [v171 floatValue];
              double v173 = v172 - v167;

              double v131 = v164 + v164;
              double v134 = v167 + v167;
              double v132 = v170;
              double v133 = v173;
            }
            +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v132, v133, v131, v134);
            id v174 = objc_claimAutoreleasedReturnValue();
            Mutable = (CGPath *)[v174 CGPath];

            CGPathRetain(Mutable);
            goto LABEL_143;
          }
          Mutable = CGPathCreateMutable();
          v94 = [v13 objectForKeyedSubscript:@"x1"];
          [v94 floatValue];
          CGFloat v96 = v95;
          v97 = [v13 objectForKeyedSubscript:@"y1"];
          [v97 floatValue];
          CGPathMoveToPoint(Mutable, 0, v96, v98);

          v99 = [v13 objectForKeyedSubscript:@"x2"];
          [v99 floatValue];
          CGFloat v101 = v100;
          v102 = [v13 objectForKeyedSubscript:@"y2"];
          [v102 floatValue];
          CGPathAddLineToPoint(Mutable, 0, v101, v103);
        }
LABEL_93:
        v179 = self;
        v86 = [v13 objectForKeyedSubscript:@"stroke-width"];
        v87 = [v13 objectForKeyedSubscript:@"stroke-linecap"];
        v88 = [v13 objectForKeyedSubscript:@"stroke-linejoin"];
        id v177 = v13;
        v89 = [v13 objectForKeyedSubscript:@"stroke-miterlimit"];
        double v90 = 1.0;
        if (v86 && ([v86 isEqualToString:&stru_101538650] & 1) == 0)
        {
          [v86 floatValue];
          double v90 = v91;
        }
        if (v87
          && ([v87 isEqualToString:&stru_101538650] & 1) == 0
          && ([v87 isEqualToString:@"butt"] & 1) == 0)
        {
          if ([v87 isEqualToString:@"round"])
          {
            uint64_t v92 = 1;
LABEL_122:
            if (v88
              && ([v88 isEqualToString:&stru_101538650] & 1) == 0
              && ([v88 isEqualToString:@"miter"] & 1) == 0)
            {
              if ([v87 isEqualToString:@"round"])
              {
                uint64_t v139 = 1;
                goto LABEL_139;
              }
              if ([v87 isEqualToString:@"bevel"])
              {
                uint64_t v139 = 2;
                goto LABEL_139;
              }
              int v186 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDA88);
              }
              v140 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v140, OS_LOG_TYPE_ERROR)) {
                sub_1010B8D74((uint64_t)v88, v186);
              }

              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDAA8);
              }
              v141 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v141, OS_LOG_TYPE_ERROR)) {
                sub_1010B8CD8();
              }

              v142 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
              v143 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
              +[CRLAssertionHandler handleFailureInFunction:v142, v143, 254, 0, "Unexpected Line Join Style: %@", v88 file lineNumber isFatal description];
            }
            uint64_t v139 = 0;
LABEL_139:
            v144 = +[CRLBezierPath bezierPathWithCGPath:Mutable];
            [v144 setLineWidth:v90];
            [v144 setLineCapStyle:v92];
            [v144 setLineJoinStyle:v139];
            if (v89 && ([v89 isEqualToString:&stru_101538650] & 1) == 0)
            {
              [v89 floatValue];
              [v144 setMiterLimit:v145];
            }
            id v146 = [v144 strokedCopy];
            Mutable = (CGPath *)[v146 CGPath];

            CGPathRetain(Mutable);
            id v13 = v177;
            self = v179;
LABEL_143:
            long long v147 = *(_OWORD *)&self->mGroupedAffineTransform.c;
            *(_OWORD *)&buf.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
            *(_OWORD *)&buf.c = v147;
            *(_OWORD *)&buf.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
            v148 = [v13 objectForKeyedSubscript:@"transform"];

            if (v148)
            {
              memset(&t2, 0, sizeof(t2));
              v149 = [v13 objectForKeyedSubscript:@"transform"];
              +[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:v149];

              CGAffineTransform t1 = buf;
              CGAffineTransform v187 = t2;
              CGAffineTransformConcat(&buf, &t1, &v187);
            }
            CGAffineTransform t2 = buf;
            long long v150 = *(_OWORD *)&CGAffineTransformIdentity.c;
            *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
            *(_OWORD *)&t1.c = v150;
            *(_OWORD *)&t1.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
            if (!CGAffineTransformEqualToTransform(&t2, &t1))
            {
              CGPathRef v151 = CGPathCreateCopyByTransformingPath(Mutable, &buf);
              CGPathRelease(Mutable);
              Mutable = v151;
            }
            v152 = +[CRLBezierPath bezierPathWithCGPath:Mutable];
            [v152 setWindingRule:self->mUsesEvenOdd];
            CGPathRelease(Mutable);
            mFileBezierPath = self->mFileBezierPath;
            p_mFileBezierPath = &self->mFileBezierPath;
            v195[0] = mFileBezierPath;
            v195[1] = v152;
            v155 = +[NSArray arrayWithObjects:v195 count:2];
            v156 = +[CRLBezierPath uniteBezierPaths:v155];

            if ([v156 isEmpty])
            {
              v72 = v183;
              if ([v152 isEmpty]) {
                goto LABEL_155;
              }
              [v152 controlPointBounds];
              if (v158 <= 1.0) {
                goto LABEL_155;
              }
              v159 = v152;
              if (v157 <= 1.0) {
                goto LABEL_155;
              }
            }
            else
            {
              [v156 controlPointBounds];
              v72 = v183;
              if (v161 <= 1.0) {
                goto LABEL_155;
              }
              v159 = v156;
              if (v160 <= 1.0) {
                goto LABEL_155;
              }
            }
            objc_storeStrong((id *)p_mFileBezierPath, v159);
LABEL_155:

            goto LABEL_156;
          }
          if ([v87 isEqualToString:@"square"])
          {
            uint64_t v92 = 2;
            goto LABEL_122;
          }
          int v185 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDA48);
          }
          v135 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v135, OS_LOG_TYPE_ERROR)) {
            sub_1010B8E04((uint64_t)v87, v185);
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDA68);
          }
          v136 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v136, OS_LOG_TYPE_ERROR)) {
            sub_1010B8CD8();
          }

          v137 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
          v138 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
          +[CRLAssertionHandler handleFailureInFunction:v137, v138, 242, 0, "Unexpected Line Cap Style: %@", v87 file lineNumber isFatal description];
        }
        uint64_t v92 = 0;
        goto LABEL_122;
      }
      v83 = [v13 objectForKeyedSubscript:@"points"];
      v84 = +[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:v83];
    }
    Mutable = v84;

    if ((v82 & 1) == 0) {
      goto LABEL_143;
    }
    goto LABEL_93;
  }
LABEL_156:
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
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
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
  return +[CRLSVGToBezierPathConverter newPathFromSVGPathString:a3 shouldClosePathAtEnd:0];
}

+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4
{
  BOOL v61 = a4;
  id v4 = a3;
  Mutable = CGPathCreateMutable();
  CGPoint v67 = CGPointZero;
  *(CGPoint *)y = CGPointZero;
  double v62 = v4;
  v6 = +[NSScanner scannerWithString:v4];
  uint64_t v83 = *(void *)asc_101178B78;
  int v84 = 2883717;
  id v7 = +[NSString stringWithCharacters:&v83 length:6];
  long long v8 = +[NSCharacterSet characterSetWithCharactersInString:v7];
  [v6 setCharactersToBeSkipped:v8];

  if ([v6 isAtEnd])
  {
    int v9 = 0;
    id v10 = 0;
    id v11 = 0;
    goto LABEL_3;
  }
  unsigned __int16 v17 = 0;
  id v10 = 0;
  double v18 = CGPointZero.y;
  double v65 = v18;
  double x = CGPointZero.x;
  double v19 = CGPointZero.x;
  double v20 = v18;
  while (2)
  {
    v21 = v10;
    v22 = +[NSCharacterSet letterCharacterSet];
    id v74 = v10;
    unsigned int v23 = [v6 scanCharactersFromSet:v22 intoString:&v74];
    id v10 = v74;

    if (v23) {
      [v6 setScanLocation:((unsigned char *)[v6 scanLocation] - (unsigned char *)[v10 length]) + 1];
    }
    id v11 = [v10 characterAtIndex:0];
    double v24 = v18;
    double v25 = CGPointZero.x;
    if (!CGPathIsEmpty(Mutable))
    {
      CGPoint CurrentPoint = CGPathGetCurrentPoint(Mutable);
      double v25 = CurrentPoint.x;
      double v24 = CurrentPoint.y;
    }
    v27 = +[NSCharacterSet lowercaseLetterCharacterSet];
    unsigned int v28 = [v27 characterIsMember:v11];

    double v29 = v18;
    double v30 = CGPointZero.x;
    if (v28)
    {
      CGPoint v31 = CGPathGetCurrentPoint(Mutable);
      double v30 = v31.x;
      double v29 = v31.y;
    }
    if ((int)v11 <= 96)
    {
      switch((int)v11)
      {
        case 'A':
          goto LABEL_26;
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
          goto LABEL_100;
        case 'C':
          goto LABEL_34;
        case 'H':
          goto LABEL_41;
        case 'L':
          goto LABEL_42;
        case 'M':
          goto LABEL_48;
        case 'Q':
          goto LABEL_50;
        case 'S':
          goto LABEL_55;
        case 'T':
          goto LABEL_66;
        case 'V':
          goto LABEL_76;
        default:
          if (v11 != 90) {
            goto LABEL_100;
          }
          goto LABEL_80;
      }
    }
    switch((int)v11)
    {
      case 'a':
LABEL_26:
        *(void *)CGAffineTransform buf = 0;
        v69.double x = 0.0;
        v68.double x = 0.0;
        uint64_t v72 = 0;
        uint64_t v73 = 0;
        double v70 = 0.0;
        double v71 = 0.0;
        unsigned int v32 = [v6 crl_scanCGFloat:buf];
        if (v32)
        {
          unsigned int v32 = [v6 crl_scanCGFloat:&v69];
          if (v32)
          {
            unsigned int v32 = [v6 crl_scanCGFloat:&v68];
            if (v32)
            {
              unsigned int v32 = [v6 scanInteger:&v73];
              if (v32)
              {
                unsigned int v32 = [v6 scanInteger:&v72];
                if (v32)
                {
                  unsigned int v32 = [v6 crl_scanCGFloat:&v71];
                  if (v32) {
                    unsigned int v32 = [v6 crl_scanCGFloat:&v70];
                  }
                }
              }
            }
          }
        }
        int v9 = v32 ^ 1;
        double v70 = v29 + v70;
        double v71 = v30 + v71;
        v33 = sub_1000D50F8(v73 != 0, v72 != 0, v25, v24, *(double *)buf, v69.x, v68.x, v71, v70);
        uint64_t v34 = sub_1003482F0(v33);
        id v35 = sub_1000D541C(Mutable, v33, 1, v34);
        CGPathRelease(v33);
        CGPathRelease(Mutable);
        Mutable = CGPathCreateMutableCopy(v35);
        CGPathRelease(v35);
        goto LABEL_94;
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
        goto LABEL_100;
      case 'c':
LABEL_34:
        *(CGPoint *)CGAffineTransform buf = v67;
        CGPoint v68 = v67;
        CGPoint v69 = v67;
        unsigned int v36 = [v6 crl_scanCGFloat:buf];
        if (v36)
        {
          unsigned int v36 = [v6 crl_scanCGFloat:&buf[8]];
          if (v36)
          {
            unsigned int v36 = [v6 crl_scanCGFloat:&v69];
            if (v36)
            {
              unsigned int v36 = [v6 crl_scanCGFloat:&v69.y];
              if (v36)
              {
                unsigned int v36 = [v6 crl_scanCGFloat:&v68];
                if (v36) {
                  unsigned int v36 = [v6 crl_scanCGFloat:&v68.y];
                }
              }
            }
          }
        }
        int v9 = v36 ^ 1;
        *(double *)CGAffineTransform buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.double x = v30 + v69.x;
        v69.y = v29 + v69.y;
        v68.double x = v30 + v68.x;
        v68.y = v29 + v68.y;
        CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y, v68.x, v68.y);
        double v65 = v69.y;
        double x = v69.x;
        goto LABEL_94;
      case 'h':
LABEL_41:
        int v9 = [v6 crl_scanCGFloat:y] ^ 1;
        double v37 = v30 + y[0];
        v38 = Mutable;
        double v39 = v24;
        goto LABEL_84;
      case 'l':
LABEL_42:
        unsigned int v40 = [v6 crl_scanCGFloat:y];
        if (v40) {
          unsigned int v40 = [v6 crl_scanCGFloat:&y[1]];
        }
        int v9 = v40 ^ 1;
        if (v28)
        {
          if (y[0] == CGPointZero.x && y[1] == v18) {
            goto LABEL_94;
          }
        }
        else if (y[0] == v25 && y[1] == v24)
        {
          goto LABEL_94;
        }
        double v37 = v30 + y[0];
        double v39 = v29 + y[1];
        v38 = Mutable;
LABEL_84:
        CGPathAddLineToPoint(v38, 0, v37, v39);
        goto LABEL_94;
      case 'm':
LABEL_48:
        if (objc_msgSend(v6, "crl_scanCGFloat:", y)) {
          unsigned int v41 = [v6 crl_scanCGFloat:&y[1]];
        }
        else {
          unsigned int v41 = 0;
        }
        uint64_t v49 = sub_1003482F0(Mutable);
        double v50 = y[0];
        if (v49 < 1)
        {
          double v51 = y[1];
        }
        else
        {
          double v50 = v30 + y[0];
          double v51 = v29 + y[1];
        }
        CGPathMoveToPoint(Mutable, 0, v50, v51);
        if (objc_msgSend(v6, "crl_scanCGFloat:", y))
        {
          do
          {
            unsigned int v41 = [v6 crl_scanCGFloat:&y[1]];
            if (v28)
            {
              CGPoint v52 = CGPathGetCurrentPoint(Mutable);
              double v30 = v52.x;
              double v29 = v52.y;
            }
            CGPathAddLineToPoint(Mutable, 0, v30 + y[0], v29 + y[1]);
          }
          while ([v6 crl_scanCGFloat:y] & 1) != 0);
        }
        int v9 = v41 ^ 1;
        goto LABEL_94;
      case 'q':
LABEL_50:
        *(CGPoint *)CGAffineTransform buf = v67;
        CGPoint v69 = v67;
        unsigned int v42 = [v6 crl_scanCGFloat:buf];
        if (v42)
        {
          unsigned int v42 = [v6 crl_scanCGFloat:&buf[8]];
          if (v42)
          {
            unsigned int v42 = [v6 crl_scanCGFloat:&v69];
            if (v42) {
              unsigned int v42 = [v6 crl_scanCGFloat:&v69.y];
            }
          }
        }
        int v9 = v42 ^ 1;
        *(double *)CGAffineTransform buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.double x = v30 + v69.x;
        v69.y = v29 + v69.y;
        CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y);
        double v19 = *(double *)buf;
        double v20 = *(double *)&buf[8];
        goto LABEL_94;
      case 's':
LABEL_55:
        double v63 = v20;
        double v64 = v19;
        __int16 v43 = (unsigned __int16)(v17 - 67) >> 4;
        if (v43 & 0xFFFC | (unsigned __int16)((v17 - 67) << 12)) {
          double v44 = -0.0;
        }
        else {
          double v44 = v25 - x;
        }
        if (v43 & 0xFFFC | (unsigned __int16)((v17 - 67) << 12)) {
          double v45 = -0.0;
        }
        else {
          double v45 = v24 - v65;
        }
        *(CGPoint *)CGAffineTransform buf = v67;
        CGPoint v69 = v67;
        unsigned int v46 = [v6 crl_scanCGFloat:buf];
        if (v46)
        {
          unsigned int v46 = [v6 crl_scanCGFloat:&buf[8]];
          if (v46)
          {
            unsigned int v46 = [v6 crl_scanCGFloat:&v69];
            if (v46) {
              unsigned int v46 = [v6 crl_scanCGFloat:&v69.y];
            }
          }
        }
        int v9 = v46 ^ 1;
        *(double *)CGAffineTransform buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.double x = v30 + v69.x;
        v69.y = v29 + v69.y;
        CGPathAddCurveToPoint(Mutable, 0, v25 + v44, v24 + v45, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y);
        double v65 = *(double *)&buf[8];
        double x = *(double *)buf;
        double v20 = v63;
        double v19 = v64;
        goto LABEL_94;
      case 't':
LABEL_66:
        if (v17 - 81 > 0x23)
        {
          double v19 = v25;
          double v20 = v24;
        }
        else
        {
          uint64_t v47 = 1 << (v17 - 81);
          if ((v47 & 0x900000009) != 0) {
            double v19 = v25 + v25 - v19;
          }
          else {
            double v19 = v25;
          }
          if ((v47 & 0x900000009) != 0) {
            double v20 = v24 + v24 - v20;
          }
          else {
            double v20 = v24;
          }
        }
        *(void *)CGAffineTransform buf = 0;
        *(void *)&buf[8] = 0;
        unsigned int v48 = [v6 crl_scanCGFloat:buf];
        if (v48) {
          unsigned int v48 = [v6 crl_scanCGFloat:&buf[8]];
        }
        int v9 = v48 ^ 1;
        *(double *)CGAffineTransform buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        CGPathAddQuadCurveToPoint(Mutable, 0, v19, v20, *(CGFloat *)buf, *(CGFloat *)&buf[8]);
        goto LABEL_94;
      case 'v':
LABEL_76:
        int v9 = [v6 crl_scanCGFloat:&y[1]] ^ 1;
        double v39 = v29 + y[1];
        v38 = Mutable;
        double v37 = v25;
        goto LABEL_84;
      default:
        if (v11 == 122)
        {
LABEL_80:
          CGPathCloseSubpath(Mutable);
          int v9 = 0;
LABEL_94:
          if ([v6 isAtEnd]) {
            goto LABEL_3;
          }
          unsigned __int16 v17 = (unsigned __int16)v11;
          if (v9) {
            goto LABEL_3;
          }
          continue;
        }
LABEL_100:
        unsigned int v54 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FDAC8);
        }
        v55 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CGAffineTransform buf = 67110146;
          *(_DWORD *)&buf[4] = v54;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]";
          __int16 v77 = 2082;
          long long v78 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m";
          __int16 v79 = 1024;
          int v80 = 570;
          __int16 v81 = 2112;
          id v82 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot process path of type %@", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FDAE8);
        }
        double v56 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          double v59 = v56;
          CGFloat v60 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)CGAffineTransform buf = 67109378;
          *(_DWORD *)&buf[4] = v54;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v60;
          _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        CGFloat v57 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]");
        v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
        +[CRLAssertionHandler handleFailureInFunction:v57, v58, 570, 0, "Cannot process path of type %@", v10 file lineNumber isFatal description];

        [v6 isAtEnd];
        int v9 = 1;
LABEL_3:
        if (v61 && (v11 | 0x20) != 0x7A)
        {
          MutableCopy = CGPathCreateMutableCopy(Mutable);
          CGPathRelease(Mutable);
          CGPathCloseSubpath(MutableCopy);
          Mutable = MutableCopy;
          if (v9)
          {
LABEL_6:
            int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDB08);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010B90FC(v12);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDB28);
            }
            long long v13 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010B8B9C(v13);
            }
            long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]");
            long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 590, 0, "Bailing on operation %c", v11);
          }
        }
        else if (v9)
        {
          goto LABEL_6;
        }

        return Mutable;
    }
  }
}

+ (CGPath)newPathFromSVGPolylineString:(id)a3
{
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  CGPoint v12 = CGPointZero;
  v5 = +[NSScanner scannerWithString:v3];
  uint64_t v13 = *(void *)asc_101178B78;
  int v14 = 2883717;
  v6 = +[NSString stringWithCharacters:&v13 length:6];
  id v7 = +[NSCharacterSet characterSetWithCharactersInString:v6];
  [v5 setCharactersToBeSkipped:v7];

  if (objc_msgSend(v5, "crl_scanCGFloat:", &v12)
    && (objc_msgSend(v5, "crl_scanCGFloat:", &v12.y) & 1) != 0)
  {
    CGPathMoveToPoint(Mutable, 0, v12.x, v12.y);
    if (([v5 isAtEnd] & 1) == 0)
    {
      while (objc_msgSend(v5, "crl_scanCGFloat:", &v12)
           && (objc_msgSend(v5, "crl_scanCGFloat:", &v12.y) & 1) != 0)
      {
        CGPathAddLineToPoint(Mutable, 0, v12.x, v12.y);
        if ([v5 isAtEnd]) {
          goto LABEL_18;
        }
      }
      [v5 isAtEnd];
    }
LABEL_18:
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDB48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B91A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDB68);
    }
    long long v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8B9C(v8);
    }
    int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:607 isFatal:0 description:"No value for initial polyline point!"];
  }
  return Mutable;
}

+ (CGPath)newPathFromSVGPolygonString:(id)a3
{
  id v3 = +[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:a3];
  MutableCopy = CGPathCreateMutableCopy(v3);
  CGPathRelease(v3);
  CGPathCloseSubpath(MutableCopy);
  return MutableCopy;
}

+ (CGAffineTransform)transformFromSVGTransformAttributeString:(SEL)a3
{
  id v5 = a4;
  id v101 = 0;
  v6 = +[NSRegularExpression regularExpressionWithPattern:@"(matrix|translate|scale|rotate)\\((.*?)\\)" options:1 error:&v101];
  id v85 = v101;
  v86 = v6;
  id v7 = [v6 matchesInString:v5 options:0 range:[v5 length]];
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->CGFloat c = v8;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v7;
  id v92 = [v7 countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v92)
  {
    int v9 = &off_1014C1000;
    CGFloat b = CGAffineTransformIdentity.b;
    tdouble x = CGAffineTransformIdentity.tx;
    CGFloat d = CGAffineTransformIdentity.d;
    CGFloat c = CGAffineTransformIdentity.c;
    CGFloat ty = CGAffineTransformIdentity.ty;
    uint64_t v91 = *(void *)v98;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v98 != v91) {
          objc_enumerationMutation(obj);
        }
        v94 = (char *)v12;
        uint64_t v13 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v12);
        id v14 = [v13 rangeAtIndex:1];
        float v95 = [v5 substringWithRange:v14, v15];
        id v16 = [v13 rangeAtIndex:2];
        v93 = [v5 substringWithRange:v16, v17];
        double v18 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:");
        uint64_t v103 = *(void *)asc_101178B78;
        int v104 = 2883717;
        double v19 = [(__objc2_class *)v9[107] stringWithCharacters:&v103 length:6];
        double v20 = +[NSCharacterSet characterSetWithCharactersInString:v19];
        [v18 setCharactersToBeSkipped:v20];

        v21 = +[NSMutableArray array];
        if (([v18 isAtEnd] & 1) == 0)
        {
          unint64_t v43 = 1;
          do
          {
            t2.double a = 0.0;
            unsigned __int8 v44 = [v18 crl_scanCGFloat:&t2];
            HIDWORD(v45) = HIDWORD(t2.a);
            *(float *)&double v45 = t2.a;
            unsigned int v46 = +[NSNumber numberWithFloat:v45];
            [v21 addObject:v46];
            if (v43 >= 7)
            {
              unsigned int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDB88);
              }
              unsigned int v48 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v47;
                LOWORD(buf.b) = 2082;
                *(void *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
                WORD1(buf.c) = 2082;
                *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVG"
                                                  "ToBezierPathConverter.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 676;
                WORD1(buf.tx) = 2112;
                *(void *)((char *)&buf.tx + 4) = v5;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Too many numbers for transform %@", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FDBA8);
              }
              uint64_t v49 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                CGPoint v52 = v49;
                v53 = +[CRLAssertionHandler packedBacktraceString];
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v47;
                LOWORD(buf.b) = 2114;
                *(void *)((char *)&buf.b + 2) = v53;
                _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
              }
              double v50 = [(__objc2_class *)v9[107] stringWithUTF8String:"+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
              double v51 = [(__objc2_class *)v9[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
              +[CRLAssertionHandler handleFailureInFunction:v50, v51, 676, 0, "Too many numbers for transform %@", v5 file lineNumber isFatal description];

              unsigned __int8 v44 = 0;
            }

            if ([v18 isAtEnd]) {
              break;
            }
            ++v43;
          }
          while ((v44 & 1) != 0);
        }
        v22 = v95;
        if ([v95 isEqualToString:@"matrix"])
        {
          if ([v21 count] != (id)6)
          {
            unsigned int v58 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDBC8);
            }
            CGFloat v57 = v94;
            double v59 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.a) = 67110146;
              HIDWORD(buf.a) = v58;
              LOWORD(buf.b) = 2082;
              *(void *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
              WORD1(buf.c) = 2082;
              *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGTo"
                                                "BezierPathConverter.m";
              WORD2(buf.d) = 1024;
              *(_DWORD *)((char *)&buf.d + 6) = 694;
              WORD1(buf.tx) = 2112;
              *(void *)((char *)&buf.tx + 4) = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not enough numbers for matrix transform! %@", (uint8_t *)&buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDBE8);
            }
            CGFloat v60 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              __int16 v77 = v60;
              long long v78 = +[CRLAssertionHandler packedBacktraceString];
              LODWORD(buf.a) = 67109378;
              HIDWORD(buf.a) = v58;
              LOWORD(buf.b) = 2114;
              *(void *)((char *)&buf.b + 2) = v78;
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
            }
            unsigned int v42 = [(__objc2_class *)v9[107] stringWithUTF8String:"+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
            BOOL v61 = [(__objc2_class *)v9[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
            +[CRLAssertionHandler handleFailureInFunction:v42, v61, 694, 0, "Not enough numbers for matrix transform! %@", v5 file lineNumber isFatal description];
LABEL_38:

            double v41 = ty;
            double v37 = tx;
            double v34 = d;
            double v31 = c;
            double v28 = b;
            double a = CGAffineTransformIdentity.a;
            goto LABEL_47;
          }
          unsigned int v23 = [v21 objectAtIndexedSubscript:0];
          [v23 floatValue];
          double a = v24;
          v26 = [v21 objectAtIndexedSubscript:1];
          [v26 floatValue];
          double v28 = v27;
          double v29 = [v21 objectAtIndexedSubscript:2];
          [v29 floatValue];
          double v31 = v30;
          unsigned int v32 = [v21 objectAtIndexedSubscript:3];
          [v32 floatValue];
          double v34 = v33;
          id v35 = [v21 objectAtIndexedSubscript:4];
          [v35 floatValue];
          double v37 = v36;
          [v21 objectAtIndexedSubscript:5];
          double v39 = v38 = retstr;
          [v39 floatValue];
          double v41 = v40;

          retstr = v38;
          v22 = v95;

          unsigned int v42 = v23;
          int v9 = &off_1014C1000;
          goto LABEL_27;
        }
        if (![v95 isEqualToString:@"translate"])
        {
          double v41 = ty;
          double v37 = tx;
          double v34 = d;
          double v31 = c;
          double v28 = b;
          double a = CGAffineTransformIdentity.a;
          CGFloat v57 = v94;
          if (![v95 isEqualToString:@"scale"]) {
            goto LABEL_48;
          }
          if ([v21 count] == (id)2)
          {
            unsigned int v42 = [v21 objectAtIndexedSubscript:0];
            [v42 floatValue];
            double v63 = v62;
            double v64 = v21;
            uint64_t v65 = 1;
LABEL_46:
            CGPoint v68 = [v64 objectAtIndexedSubscript:v65];
            [v68 floatValue];
            CGAffineTransformMakeScale(&buf, v63, v69);
            double a = buf.a;
            double v28 = buf.b;
            double v31 = buf.c;
            double v34 = buf.d;
            double v37 = buf.tx;
            double v41 = buf.ty;

            goto LABEL_47;
          }
          if ([v21 count] == (id)1)
          {
            unsigned int v42 = [v21 objectAtIndexedSubscript:0];
            [v42 floatValue];
            double v63 = v67;
            double v64 = v21;
            uint64_t v65 = 0;
            goto LABEL_46;
          }
          unsigned int v74 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDC48);
          }
          v75 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v74;
            LOWORD(buf.b) = 2082;
            *(void *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
            WORD1(buf.c) = 2082;
            *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBe"
                                              "zierPathConverter.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 715;
            WORD1(buf.tx) = 2112;
            *(void *)((char *)&buf.tx + 4) = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Wrong number of numbers for scale transform! %@", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDC68);
          }
          v76 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            __int16 v81 = v76;
            id v82 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v74;
            LOWORD(buf.b) = 2114;
            *(void *)((char *)&buf.b + 2) = v82;
            _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
          }
          unsigned int v42 = [(__objc2_class *)v9[107] stringWithUTF8String:"+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
          BOOL v61 = [(__objc2_class *)v9[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
          +[CRLAssertionHandler handleFailureInFunction:v42, v61, 715, 0, "Wrong number of numbers for scale transform! %@", v5 file lineNumber isFatal description];
          goto LABEL_38;
        }
        if ([v21 count] == (id)2)
        {
          unsigned int v42 = [v21 objectAtIndexedSubscript:0];
          [v42 floatValue];
          CGFloat v55 = v54;
          v26 = [v21 objectAtIndexedSubscript:1];
          [v26 floatValue];
          CGAffineTransformMakeTranslation(&buf, v55, v56);
          double a = buf.a;
          double v28 = buf.b;
          double v31 = buf.c;
          double v34 = buf.d;
          double v37 = buf.tx;
          double v41 = buf.ty;
LABEL_27:

          goto LABEL_28;
        }
        if ([v21 count] != (id)1)
        {
          unsigned int v71 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          CGFloat v57 = v94;
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDC08);
          }
          uint64_t v72 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v71;
            LOWORD(buf.b) = 2082;
            *(void *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
            WORD1(buf.c) = 2082;
            *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBe"
                                              "zierPathConverter.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 705;
            WORD1(buf.tx) = 2112;
            *(void *)((char *)&buf.tx + 4) = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Wrong number of numbers for translate transform! %@", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FDC28);
          }
          uint64_t v73 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            __int16 v79 = v73;
            int v80 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v71;
            LOWORD(buf.b) = 2114;
            *(void *)((char *)&buf.b + 2) = v80;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
          }
          unsigned int v42 = [(__objc2_class *)v9[107] stringWithUTF8String:"+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"];
          BOOL v61 = [(__objc2_class *)v9[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"];
          +[CRLAssertionHandler handleFailureInFunction:v42, v61, 705, 0, "Wrong number of numbers for translate transform! %@", v5 file lineNumber isFatal description];
          goto LABEL_38;
        }
        unsigned int v42 = [v21 objectAtIndexedSubscript:0];
        [v42 floatValue];
        CGAffineTransformMakeTranslation(&buf, v66, 0.0);
        double a = buf.a;
        double v28 = buf.b;
        double v31 = buf.c;
        double v34 = buf.d;
        double v37 = buf.tx;
        double v41 = buf.ty;
LABEL_28:
        CGFloat v57 = v94;
LABEL_47:

LABEL_48:
        long long v70 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&buf.double a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&buf.CGFloat c = v70;
        *(_OWORD *)&buf.tdouble x = *(_OWORD *)&retstr->tx;
        t2.double a = a;
        t2.CGFloat b = v28;
        t2.CGFloat c = v31;
        t2.CGFloat d = v34;
        t2.tdouble x = v37;
        t2.CGFloat ty = v41;
        CGAffineTransformConcat(retstr, &buf, &t2);

        id v12 = v57 + 1;
      }
      while (v12 != v92);
      id v83 = [obj countByEnumeratingWithState:&v97 objects:v105 count:16];
      id v92 = v83;
    }
    while (v83);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHiddenOnTag, 0);

  objc_storeStrong((id *)&self->mFileBezierPath, 0);
}

@end