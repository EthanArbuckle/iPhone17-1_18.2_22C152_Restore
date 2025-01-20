@interface UIKBRemoteEmojiKeyplaneTransformation
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
@end

@implementation UIKBRemoteEmojiKeyplaneTransformation

+ (id)transformationIdentifier
{
  return @"UIKBRemoteEmojiKeyplaneTransformation";
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 keyboardSize];
  if (v8 != 0.0 && v7 != 0.0)
  {
    v9 = [v5 firstCachedKeyWithName:@"Emoji-Category-Control-Key"];
    v10 = v9;
    if (v9)
    {
      [v9 frame];
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
      double MinX = CGRectGetMinX(v31);
      [v5 frame];
      double v17 = v16;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      double v18 = v17 - CGRectGetMaxX(v32);
      if (MinX < v18)
      {
        [v5 frame];
        double v20 = v19 - (v18 + v18);
        v21 = [v6 screenTraits];
        v22 = [v21 screen];
        [v22 scale];
        double v24 = v23;

        v29[0] = v10;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v25, v20 - width, height - height, v24);

        v28 = v10;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        objc_msgSend(v5, "repositionKeys:withOffset:scale:", v26, v18 - x, y - y, v24);
      }
    }
  }
  return v5;
}

@end