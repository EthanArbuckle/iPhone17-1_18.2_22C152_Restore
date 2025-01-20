@interface KNAnimParameterGroup
+ (id)parameterGroupForFile:(id)a3;
- (KNAnimParameterGroup)initWithFileName:(id)a3;
- (NSArray)parameterArray;
- (NSString)name;
- (double)valueForAnimationCurve:(id)a3 atPercent:(double)a4;
- (double)valueForConstant:(id)a3;
- (id)mediaTimingFunctionForAnimationCurve:(id)a3;
- (void)dealloc;
- (void)readAnimationCurvesFromFile;
- (void)resetAnimationCurvesFromBundle;
- (void)writeAnimationCurvesToFile;
@end

@implementation KNAnimParameterGroup

+ (id)parameterGroupForFile:(id)a3
{
  id v4 = (id)qword_573358;
  if (!qword_573358)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    qword_573358 = (uint64_t)v4;
  }
  v5 = (KNAnimParameterGroup *)[v4 objectForKey:a3];
  if (!v5)
  {
    v5 = [[KNAnimParameterGroup alloc] initWithFileName:a3];
    [(id)qword_573358 setObject:v5 forKey:a3];
  }
  return v5;
}

- (double)valueForConstant:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersDict, "objectForKeyedSubscript:");
  if (!v4)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForConstant:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:77 description:@"Could not find animation parameter named %@!" a3];
    return 0.0;
  }
  v5 = v4;
  if (objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"type"), "integerValue") != (char *)&dword_0 + 1)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForConstant:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:81 description:@"Parameter '%@' is not a constant!" a3];
    return 0.0;
  }
  id v6 = [v5 objectForKeyedSubscript:@"value"];
  if (!v6)
  {
    [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:NSString stringWithUTF8String:@"-[KNAnimParameterGroup valueForConstant:]" file:NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m" lineNumber:86 description:@"No value found in parameter %@!" a3];
    return 0.0;
  }

  [v6 doubleValue];
  return result;
}

- (double)valueForAnimationCurve:(id)a3 atPercent:(double)a4
{
  if (a4 < 0.0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"] lineNumber:95 description:@"percent < 0!"];
  }
  if (a4 > 1.0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:96 description:@"percent > 0!"];
  }
  id v7 = [(NSMutableDictionary *)self->_parametersDict objectForKeyedSubscript:a3];
  if (!v7)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"] lineNumber:100 description:@"Could not find animation curve named %@!" a3];
    return 0.0;
  }
  id v8 = [v7 objectForKeyedSubscript:@"value"];
  if (!v8)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:105 description:@"No path found in curve named %@!" a3];
    return 0.0;
  }

  [v8 yValueFromXValue:a4];
  return result;
}

- (id)mediaTimingFunctionForAnimationCurve:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersDict, "objectForKeyedSubscript:");
  if (!v4)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:117 description:@"Could not find animation curve named %@!" a3];
    return 0;
  }
  v5 = v4;
  if (objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", @"type"), "integerValue") != (char *)&dword_8 + 2)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:121 description:@"Parameter '%@' is not a simple path!" a3];
    return 0;
  }
  id v6 = [v5 objectForKeyedSubscript:@"value"];
  if (!v6)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:126 description:@"No path found in curve named %@!" a3];
    return 0;
  }
  id v7 = v6;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if ((uint64_t)[v6 elementCount] < 2)
  {
    double v16 = CGPointZero.x;
    double v15 = y;
  }
  else
  {
    uint64_t v14 = 1;
    double v15 = y;
    double v16 = CGPointZero.x;
    do
    {
      if ([v7 elementAtIndex:v14 associatedPoints:v18] == (char *)&dword_0 + 2)
      {
        double v16 = *(double *)v18;
        double v15 = *(double *)&v18[1];
        double x = *(double *)&v18[2];
        double y = *(double *)&v18[3];
      }
      ++v14;
    }
    while (v14 < (uint64_t)[v7 elementCount]);
  }
  *(float *)&double v10 = v16;
  *(float *)&double v11 = v15;
  *(float *)&double v12 = x;
  *(float *)&double v13 = y;
  return +[CAMediaTimingFunction functionWithControlPoints:v10 :v11 :v12 :v13];
}

- (KNAnimParameterGroup)initWithFileName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KNAnimParameterGroup;
  id v4 = [(KNAnimParameterGroup *)&v6 init];
  if (v4)
  {
    if (!a3) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNAnimParameterGroup initWithFileName:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"] lineNumber:151 description:@"nil file path to animation parameters!"];
    }
    v4->_fileName = (NSString *)a3;
    v4->_originalFileName = (NSString *)a3;
    v4->_name = (NSString *)objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "stringByDeletingPathExtension");
    [(KNAnimParameterGroup *)v4 readAnimationCurvesFromFile];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KNAnimParameterGroup;
  [(KNAnimParameterGroup *)&v3 dealloc];
}

- (void)readAnimationCurvesFromFile
{
  p_fileName = &self->_fileName;
  if (([objc_alloc_init((Class)NSFileManager) fileExistsAtPath:self->_fileName] & 1) == 0) {
    [TSUAssertionHandler currentHandler][self handleFailureInFunction:@"-[KNAnimParameterGroup readAnimationCurvesFromFile]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m" lineNumber:224 description:@"File doesn't exist at path! %@", *p_fileName];
}
  id v4 = +[NSData dataWithContentsOfFile:*p_fileName];
  }
  uint64_t v21 = 0;
  id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v21];
  if (v21)
  {
    objc_super v6 = THLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2A0E74();
    }
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = [v5 decodeObjectOfClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0) forKey:NSKeyedArchiveRootObjectKey];
    v23 = +[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:1];
    double v12 = [NSMutableArray arrayWithArray:[v11 sortedArrayUsingDescriptors:[NSArray arrayWithObjects:&v23, 1]]];
    if (!v12) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup readAnimationCurvesFromFile]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:236 description:@"Invalid file??? %@", *p_fileName];
    }
    [(KNAnimParameterGroup *)self willChangeValueForKey:@"parameterArray"];
    self->_parameterArradouble y = (NSArray *)v12;
    [(KNAnimParameterGroup *)self didChangeValueForKey:@"parameterArray"];

    self->_parametersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parametersDict, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), [*(id *)(*((void *)&v17 + 1) + 8 * i) objectForKeyedSubscript:@"name"]);
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)resetAnimationCurvesFromBundle
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  id v4 = [(NSString *)NSHomeDirectory() stringByAppendingPathComponent:@"Keynote Animation Parameters"];
  if (([v3 fileExistsAtPath:v4] & 1) == 0) {
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:0];
  }
  p_fileName = &self->_fileName;
  objc_super v6 = [(NSString *)v4 stringByAppendingPathComponent:[(NSString *)self->_fileName lastPathComponent]];
  if (([v3 fileExistsAtPath:v6] & 1) == 0)
  {
    uint64_t v26 = 0;
    if (([v3 copyItemAtPath:*p_fileName toPath:v6 error:&v26] & 1) == 0)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup resetAnimationCurvesFromBundle]");
      uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"];
      [v7 handleFailureInFunction:v8, v9, 273, @"%@", v26 file lineNumber description];
    }
  }
  if (([v3 fileExistsAtPath:*p_fileName] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup resetAnimationCurvesFromBundle]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m") lineNumber:276 description:@"File doesn't exist at path! %@", *p_fileName];
  }
  uint64_t v10 = +[NSData dataWithContentsOfFile:self->_originalFileName];
  uint64_t v26 = 0;
  id v11 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v10 error:&v26];
  if (v26)
  {
    double v12 = THLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2A0EE4();
    }
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = [v11 decodeObjectOfClasses:+[NSSet setWithObjects:v13, v14, v15, v16, objc_opt_class(), 0] forKey:NSKeyedArchiveRootObjectKey];
    if (!v17) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNAnimParameterGroup resetAnimationCurvesFromBundle]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"] lineNumber:285 description:@"Invalid file??? %@", self->_originalFileName];
    }
    [(KNAnimParameterGroup *)self willChangeValueForKey:@"parameterArray"];
    self->_parameterArradouble y = (NSArray *)v17;
    [(KNAnimParameterGroup *)self didChangeValueForKey:@"parameterArray"];

    self->_parametersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = [v17 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parametersDict, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:@"name"]);
        }
        id v19 = [v17 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v19);
    }
    +[NSKeyedArchiver archiveRootObject:self->_parameterArray toFile:self->_fileName];
  }
}

- (void)writeAnimationCurvesToFile
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  id v4 = [(NSString *)NSHomeDirectory() stringByAppendingPathComponent:@"Keynote Animation Parameters"];
  if (([v3 fileExistsAtPath:v4] & 1) == 0) {
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:0];
  }
  id v5 = [(NSString *)v4 stringByAppendingPathComponent:[(NSString *)self->_fileName lastPathComponent]];
  if (([v3 fileExistsAtPath:v5] & 1) == 0)
  {
    uint64_t v25 = 0;
    if ([v3 copyItemAtPath:self->_fileName toPath:v5 error:&v25]) {
      goto LABEL_13;
    }
    id v21 = +[TSUAssertionHandler currentHandler];
    long long v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"];
    CFStringRef v17 = @"%@";
    uint64_t v24 = v25;
    id v18 = v21;
    id v19 = v22;
    uint64_t v20 = 326;
    goto LABEL_12;
  }
  uint64_t v25 = 0;
  id v6 = [v3 attributesOfItemAtPath:v5 error:&v25];
  if (v25)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"];
    [v7 handleFailureInFunction:v8, v9, 332, @"Error trying to look at %@: %@", v5, v25 file lineNumber description];
  }
  id v10 = [v3 attributesOfItemAtPath:self->_fileName error:&v25];
  if (v25)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"];
    [v11 handleFailureInFunction:v12, v13, 334, @"Error trying to look at %@: %@", self->_fileName, v25 file lineNumber description];
  }
  if (objc_msgSend(objc_msgSend(v6, "objectForKey:", NSFileModificationDate), "compare:", objc_msgSend(v10, "objectForKey:", NSFileModificationDate)) == (id)-1)
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"];
    CFStringRef v17 = @"Warning! File in Desktop's \"Keynote Animation Parameters\" is less recent than packaged parameter file!";
    id v18 = v14;
    id v19 = v15;
    uint64_t v20 = 340;
LABEL_12:
    [v18 handleFailureInFunction:v19 file:v16 lineNumber:v20 description:v17 v24];
  }
LABEL_13:

  long long v23 = v5;
  self->_fileName = v23;
  if (([v3 fileExistsAtPath:v23] & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNAnimParameterGroup writeAnimationCurvesToFile]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"] lineNumber:347 description:@"File doesn't exist at path! %@", self->_fileName];
  }
  +[NSKeyedArchiver archiveRootObject:self->_parameterArray toFile:self->_fileName];
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)parameterArray
{
  return self->_parameterArray;
}

@end