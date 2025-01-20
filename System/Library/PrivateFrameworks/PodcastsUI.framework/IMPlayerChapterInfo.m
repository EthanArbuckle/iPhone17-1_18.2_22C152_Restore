@interface IMPlayerChapterInfo
- ($FE7ED0E05F0D31DE1948BDABFA0192D4)assetTimeRange;
- ($FE7ED0E05F0D31DE1948BDABFA0192D4)mediaTimeRange;
- (BOOL)isEqual:(id)a3;
- (NSData)artworkData;
- (NSString)title;
- (NSURL)externalURL;
- (UIImage)artwork;
- (double)duration;
- (double)time;
- (id)description;
- (int)metadataType;
- (int)type;
- (unint64_t)hash;
- (void)setArtworkData:(id)a3;
- (void)setAssetTimeRange:(id *)a3;
- (void)setDuration:(double)a3;
- (void)setExternalURL:(id)a3;
- (void)setMediaTimeRange:(id *)a3;
- (void)setMetadataType:(int)a3;
- (void)setTime:(double)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation IMPlayerChapterInfo

- (BOOL)isEqual:(id)a3
{
  v4 = (IMPlayerChapterInfo *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(IMPlayerChapterInfo *)self title];
      if (v6)
      {
        v7 = [(IMPlayerChapterInfo *)v5 title];
        BOOL v8 = v7 != 0;
      }
      else
      {
        BOOL v8 = 0;
      }

      uint64_t v10 = [(IMPlayerChapterInfo *)self externalURL];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [(IMPlayerChapterInfo *)v5 externalURL];

        if (v12) {
          BOOL v13 = v8;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          v14 = [(IMPlayerChapterInfo *)self title];
          v15 = [(IMPlayerChapterInfo *)v5 title];
          if ([v14 isEqualToString:v15])
          {
            v16 = [(IMPlayerChapterInfo *)self externalURL];
            v17 = [(IMPlayerChapterInfo *)v5 externalURL];
            char v9 = [v16 isEqual:v17];
          }
          else
          {
            char v9 = 0;
          }
          goto LABEL_23;
        }
        if (v8) {
          goto LABEL_18;
        }
        if (v12)
        {
          v14 = [(IMPlayerChapterInfo *)self externalURL];
          v15 = [(IMPlayerChapterInfo *)v5 externalURL];
          char v18 = [v14 isEqual:v15];
          goto LABEL_22;
        }
      }
      else if (v8)
      {
LABEL_18:
        v14 = [(IMPlayerChapterInfo *)self title];
        v15 = [(IMPlayerChapterInfo *)v5 title];
        char v18 = [v14 isEqualToString:v15];
LABEL_22:
        char v9 = v18;
LABEL_23:

LABEL_25:
        goto LABEL_26;
      }
      char v9 = 0;
      goto LABEL_25;
    }
    char v9 = 0;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(IMPlayerChapterInfo *)self title];
  if (v3)
  {
    v4 = [(IMPlayerChapterInfo *)self externalURL];

    if (v4)
    {
      v5 = [(IMPlayerChapterInfo *)self title];
      uint64_t v6 = [v5 hash];
      v7 = [(IMPlayerChapterInfo *)self externalURL];
      v3 = (void *)([v7 hash] ^ v6);
    }
    else
    {
      v3 = 0;
    }
  }
  BOOL v8 = [(IMPlayerChapterInfo *)self title];

  if (v8)
  {
    char v9 = [(IMPlayerChapterInfo *)self title];
LABEL_11:
    v12 = v9;
    v3 = (void *)[v9 hash];

    return (unint64_t)v3;
  }
  uint64_t v10 = [(IMPlayerChapterInfo *)self externalURL];

  if (v10)
  {
    char v9 = [(IMPlayerChapterInfo *)self externalURL];
    goto LABEL_11;
  }
  v11 = [(IMPlayerChapterInfo *)self artwork];

  if (v11)
  {
    char v9 = [(IMPlayerChapterInfo *)self artwork];
    goto LABEL_11;
  }
  return (unint64_t)v3;
}

- (void)setArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkData, a3);
  id v6 = a3;
  artwork = self->_artwork;
  self->_artwork = 0;
}

- (UIImage)artwork
{
  artwork = self->_artwork;
  if (artwork)
  {
    v3 = artwork;
  }
  else
  {
    v5 = [(IMPlayerChapterInfo *)self artworkData];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4FB1818];
      v7 = [(IMPlayerChapterInfo *)self artworkData];
      BOOL v8 = [v6 imageWithData:v7];

      [v8 size];
      if (v10 > 600.0 || v9 > 600.0)
      {
        uint64_t v11 = objc_msgSend(v8, "imageWithSize:preserveAspectRatio:", 1, 600.0, 600.0);

        BOOL v8 = (void *)v11;
      }
      [v8 size];
      if (v12 != v13)
      {
        double v14 = v12;
        CGFloat v15 = v13;
        if (v12 < v13) {
          double v12 = v13;
        }
        if (v12 >= 140.0) {
          double v16 = v12;
        }
        else {
          double v16 = 140.0;
        }
        int v17 = [v8 colorAtPixelX:(unint64_t)(v14 + -1.0) y:0];
        char v18 = [MEMORY[0x1E4FB1618] colorWithRed:(float)((float)BYTE2(v17) / 255.0) green:(float)((float)BYTE1(v17) / 255.0) blue:(float)((float)v17 / 255.0) alpha:(float)((float)HIBYTE(v17) / 255.0)];
        CGFloat v19 = *MEMORY[0x1E4F1DAD8];
        CGFloat v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [v8 scale];
        CGFloat v22 = v21;
        v32.width = v16;
        v32.height = v16;
        UIGraphicsBeginImageContextWithOptions(v32, 1, v22);
        [v18 set];
        v33.origin.x = v19;
        v33.origin.y = v20;
        v33.size.width = v16;
        v33.size.height = v16;
        UIRectFill(v33);
        objc_msgSend(v8, "drawInRect:blendMode:alpha:", 0, CGRectCenterRectInRect(v19, v20, v14, v15, v19, v20, v16, v16));
        uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        BOOL v8 = (void *)v23;
      }
      if (os_feature_enabled_red_sun())
      {
        uint64_t v24 = [v8 imageByPreparingForDisplay];
        v25 = (UIImage *)v24;
        if (v24) {
          v26 = (void *)v24;
        }
        else {
          v26 = v8;
        }
        v27 = v26;
        v28 = self->_artwork;
        self->_artwork = v27;
      }
      else
      {
        v29 = v8;
        v25 = self->_artwork;
        self->_artwork = v29;
      }

      v3 = self->_artwork;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = off_1E6E20360[[(IMPlayerChapterInfo *)self type]];
  uint64_t v5 = qword_1E6E20370[[(IMPlayerChapterInfo *)self metadataType]];
  id v6 = [(IMPlayerChapterInfo *)self title];
  v7 = [(IMPlayerChapterInfo *)self externalURL];
  [(IMPlayerChapterInfo *)self time];
  uint64_t v9 = v8;
  [(IMPlayerChapterInfo *)self duration];
  uint64_t v11 = v10;
  [(IMPlayerChapterInfo *)self mediaTimeRange];
  double v12 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  [(IMPlayerChapterInfo *)self assetTimeRange];
  double v13 = (__CFString *)CMTimeRangeCopyDescription(0, &v16);
  double v14 = [v3 stringWithFormat:@"<%p> type=%s metadata_type=%s title=\"%@\" url=\"%@\" time=%f duration=%f mediaTimeRange=%@ assetTimeRange=%@", self, v4, v5, v6, v7, v9, v11, v12, v13];

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)externalURL
{
  return self->_externalURL;
}

- (void)setExternalURL:(id)a3
{
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)mediaTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (void)setMediaTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_mediaTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_mediaTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_mediaTimeRange.start.value = v3;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)assetTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setAssetTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_assetTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_assetTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_assetTimeRange.start.value = v3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)metadataType
{
  return self->_metadataType;
}

- (void)setMetadataType:(int)a3
{
  self->_metadataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_externalURL, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end