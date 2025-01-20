@interface CRLIngestionTypes
+ (BOOL)isValidFileType:(id)a3;
+ (BOOL)isValidPlainTextUTI:(id)a3;
+ (NSArray)highEfficiencyImageTypes;
+ (NSArray)highEfficiencyImageUTTypes;
+ (NSArray)imageTypesThatRequireConversion;
+ (NSArray)nativeTypes;
+ (NSArray)supported3DFileTypes;
+ (NSArray)supported3DFileUTTypes;
+ (NSArray)supportedGenericFileTypes;
+ (NSArray)supportedGenericFileUTTypes;
+ (NSArray)supportedImageTypes;
+ (NSArray)supportedImageUTTypes;
+ (NSArray)supportedMovieAnimatedImageTypes;
+ (NSArray)supportedMovieAnimatedImageUTTypes;
+ (NSArray)supportedMovieTypes;
+ (NSArray)supportedMovieUTTypes;
+ (NSArray)supportedRichTextTypes;
+ (NSArray)supportedRichTextUTTypes;
+ (NSArray)unsupportedImageTypes;
+ (id)imageUTTypesThatRequireConversion;
+ (id)p_supportedPlainTextTypes;
+ (id)p_unsupportedPlainTextTypes;
@end

@implementation CRLIngestionTypes

+ (NSArray)nativeTypes
{
  if (qword_1016A8EA0 != -1) {
    dispatch_once(&qword_1016A8EA0, &stru_1014CCC38);
  }
  v2 = (void *)qword_1016A8E98;

  return (NSArray *)v2;
}

+ (NSArray)supportedImageTypes
{
  if (qword_1016A8EB0 != -1) {
    dispatch_once(&qword_1016A8EB0, &stru_1014CCC58);
  }
  v2 = (void *)qword_1016A8EA8;

  return (NSArray *)v2;
}

+ (NSArray)supportedImageUTTypes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000315A0;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A8EC0 != -1) {
    dispatch_once(&qword_1016A8EC0, block);
  }
  v2 = (void *)qword_1016A8EB8;

  return (NSArray *)v2;
}

+ (NSArray)unsupportedImageTypes
{
  if (qword_1016A8ED0 != -1) {
    dispatch_once(&qword_1016A8ED0, &stru_1014CCC78);
  }
  v2 = (void *)qword_1016A8EC8;

  return (NSArray *)v2;
}

+ (NSArray)supportedMovieTypes
{
  v3 = [UTTypeMovie identifier];
  v9[0] = v3;
  v4 = [UTTypeAudio identifier];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];
  v6 = [a1 supportedMovieAnimatedImageTypes];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return (NSArray *)v7;
}

+ (NSArray)supportedMovieAnimatedImageTypes
{
  v3 = [UTTypeGIF identifier];
  v9[0] = v3;
  v4 = [UTTypePNG identifier];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];
  v6 = [a1 highEfficiencyImageTypes];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return (NSArray *)v7;
}

+ (NSArray)supportedMovieUTTypes
{
  v7[0] = UTTypeMovie;
  v7[1] = UTTypeAudio;
  v3 = +[NSArray arrayWithObjects:v7 count:2];
  v4 = [a1 supportedMovieAnimatedImageUTTypes];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

+ (NSArray)supportedMovieAnimatedImageUTTypes
{
  v7[0] = UTTypeGIF;
  v7[1] = UTTypePNG;
  v3 = +[NSArray arrayWithObjects:v7 count:2];
  v4 = [a1 highEfficiencyImageUTTypes];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

+ (NSArray)supported3DFileUTTypes
{
  v4[0] = UTTypeUSDZ;
  v4[1] = UTTypeRealityFile;
  v4[2] = UTTypeUSD;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

+ (NSArray)supported3DFileTypes
{
  v2 = [UTTypeUSDZ identifier];
  v3 = [UTTypeRealityFile identifier:v2];
  v7[1] = v3;
  v4 = [UTTypeUSD identifier];
  void v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (NSArray)supportedGenericFileUTTypes
{
  v4[0] = UTTypeContent;
  v4[1] = UTTypeEmailMessage;
  v4[2] = UTTypeArchive;
  void v4[3] = UTTypeZIP;
  v4[4] = UTTypeExecutable;
  v4[5] = UTTypeDatabase;
  v4[6] = UTTypeDiskImage;
  v2 = +[NSArray arrayWithObjects:v4 count:7];

  return (NSArray *)v2;
}

+ (NSArray)supportedGenericFileTypes
{
  v2 = [UTTypeContent identifier];
  v3 = [UTTypeEmailMessage identifier:v2];
  v11[1] = v3;
  v4 = [UTTypeArchive identifier];
  v11[2] = v4;
  v5 = [UTTypeZIP identifier];
  v11[3] = v5;
  v6 = [UTTypeExecutable identifier];
  v11[4] = v6;
  v7 = [UTTypeDatabase identifier];
  v11[5] = v7;
  v8 = [UTTypeDiskImage identifier];
  v11[6] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:7];

  return (NSArray *)v9;
}

+ (NSArray)supportedRichTextTypes
{
  v2 = [UTTypeRTF identifier];
  v3 = [UTTypeFlatRTFD identifier:v2];
  v7[1] = v3;
  v4 = [UTTypeRTFD identifier];
  void v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (NSArray)supportedRichTextUTTypes
{
  v4[0] = UTTypeRTF;
  v4[1] = UTTypeFlatRTFD;
  v4[2] = UTTypeRTFD;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

+ (BOOL)isValidFileType:(id)a3
{
  id v3 = a3;
  v4 = +[CRLIngestionTypes supportedGenericFileUTTypes];
  if (objc_msgSend(v3, "crl_conformsToAnyUTType:", v4))
  {
    v5 = +[CRLInfoImporterBoardItemProvider disallowedTypes];
    if ([v5 containsObject:v3])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = +[CRLIngestionTypes supportedRichTextUTTypes];
      if (objc_msgSend(v3, "crl_conformsToAnyUTType:", v7))
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v8 = [v3 identifier];
        if (+[CRLIngestionTypes isValidPlainTextUTI:v8]
          || ([v3 isEqual:UTTypeHTML] & 1) != 0)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          unsigned int v6 = [v3 isEqual:UTTypeWebArchive] ^ 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isValidPlainTextUTI:(id)a3
{
  id v4 = a3;
  v5 = [a1 p_unsupportedPlainTextTypes];
  if ([v5 containsObject:v4])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = [a1 p_supportedPlainTextTypes];
    if (objc_msgSend(v4, "crl_conformsToAnyUTI:", v7))
    {
      v8 = [a1 supportedRichTextTypes];
      unsigned int v6 = [v8 containsObject:v4] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (id)p_supportedPlainTextTypes
{
  v2 = +[NSString readableTypeIdentifiersForItemProvider];
  id v3 = [UTTypePlainText identifier];
  v10[0] = v3;
  id v4 = [UTTypeText identifier];
  v10[1] = v4;
  v5 = +[NSArray arrayWithObjects:v10 count:2];
  unsigned int v6 = [v2 arrayByAddingObjectsFromArray:v5];

  v7 = +[NSURL readableTypeIdentifiersForItemProvider];
  v8 = [v6 arrayByAddingObjectsFromArray:v7];

  return v8;
}

+ (id)p_unsupportedPlainTextTypes
{
  v2 = [UTTypeVCard identifier];
  id v3 = sub_100031098();
  id v4 = [v3 identifier:v2];
  v8[1] = v4;
  v5 = [UTTypeSVG identifier];
  v8[2] = v5;
  unsigned int v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

+ (NSArray)highEfficiencyImageTypes
{
  v2 = [UTTypeHEIC identifier];
  id v3 = [UTTypeHEIF identifier:v2];
  v8[1] = v3;
  id v4 = sub_10003277C();
  v5 = [v4 identifier];
  v8[2] = v5;
  unsigned int v6 = +[NSArray arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

+ (NSArray)highEfficiencyImageUTTypes
{
  v5[0] = UTTypeHEIC;
  v5[1] = UTTypeHEIF;
  v2 = sub_10003277C();
  v5[2] = v2;
  id v3 = +[NSArray arrayWithObjects:v5 count:3];

  return (NSArray *)v3;
}

+ (NSArray)imageTypesThatRequireConversion
{
  return (NSArray *)&__NSArray0__struct;
}

+ (id)imageUTTypesThatRequireConversion
{
  return &__NSArray0__struct;
}

@end