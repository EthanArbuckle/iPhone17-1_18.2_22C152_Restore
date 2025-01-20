@interface TVMediaInfo
- (BOOL)isEqual:(id)a3;
- (NSArray)imageProxies;
- (TVPlaylist)playlist;
- (UIColor)backgroundColor;
- (UIView)contentView;
- (UIView)overlayView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)intent;
- (unint64_t)hash;
- (void)setBackgroundColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setIntent:(int64_t)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation TVMediaInfo

- (unint64_t)hash
{
  v3 = [(TVMediaInfo *)self playlist];
  uint64_t v4 = [v3 hash];

  v5 = [(TVMediaInfo *)self overlayView];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(TVMediaInfo *)self imageProxies];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  unint64_t v8 = v7;
  if (v8 == self)
  {
    char v12 = 1;
  }
  else
  {
    int64_t v9 = [(TVMediaInfo *)self intent];
    if (v9 == [(TVMediaInfo *)v8 intent])
    {
      v10 = [(TVMediaInfo *)self playlist];
      v11 = [(TVMediaInfo *)v8 playlist];
      if (v10 != v11)
      {
        v3 = [(TVMediaInfo *)self playlist];
        uint64_t v4 = [(TVMediaInfo *)v8 playlist];
        if (![v3 isEqual:v4])
        {
          char v12 = 0;
          goto LABEL_28;
        }
      }
      v13 = [(TVMediaInfo *)self overlayView];
      v14 = [(TVMediaInfo *)v8 overlayView];
      if (v13 != v14)
      {

        char v12 = 0;
        goto LABEL_27;
      }
      v15 = [(TVMediaInfo *)self contentView];
      v16 = [(TVMediaInfo *)v8 contentView];
      if (v15 != v16)
      {
        char v12 = 0;
LABEL_26:

LABEL_27:
        if (v10 == v11)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:

        goto LABEL_29;
      }
      v27 = v15;
      uint64_t v17 = [(TVMediaInfo *)self imageProxies];
      v29 = [(TVMediaInfo *)v8 imageProxies];
      v30 = (void *)v17;
      if ((void *)v17 == v29)
      {
        v24 = v16;
      }
      else
      {
        v18 = [(TVMediaInfo *)self imageProxies];
        v25 = [(TVMediaInfo *)v8 imageProxies];
        v26 = v18;
        if (!objc_msgSend(v18, "isEqualToArray:"))
        {
          char v12 = 0;
          v15 = v27;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
        v24 = v16;
      }
      v15 = v27;
      v19 = [(TVMediaInfo *)self backgroundColor];
      v23 = [(TVMediaInfo *)v8 backgroundColor];
      v28 = v19;
      if (v19 == v23)
      {

        char v12 = 1;
      }
      else
      {
        v22 = [(TVMediaInfo *)self backgroundColor];
        v20 = [(TVMediaInfo *)v8 backgroundColor];
        char v12 = [v22 isEqual:v20];
      }
      v16 = v24;
      if (v30 == v29) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    char v12 = 0;
  }
LABEL_30:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIntent:", -[TVMediaInfo intent](self, "intent"));
  v5 = [(TVMediaInfo *)self playlist];
  [v4 setPlaylist:v5];

  id v6 = [(TVMediaInfo *)self overlayView];
  [v4 setOverlayView:v6];

  v7 = [(TVMediaInfo *)self contentView];
  [v4 setContentView:v7];

  unint64_t v8 = [(TVMediaInfo *)self imageProxies];
  [v4 setImageProxies:v8];

  int64_t v9 = [(TVMediaInfo *)self backgroundColor];
  [v4 setBackgroundColor:v9];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(TVMediaInfo *)self intent];
  v7 = [(TVMediaInfo *)self overlayView];
  unint64_t v8 = [(TVMediaInfo *)self contentView];
  int64_t v9 = [(TVMediaInfo *)self backgroundColor];
  v10 = [(TVMediaInfo *)self playlist];
  v11 = [(TVMediaInfo *)self imageProxies];
  char v12 = [v3 stringWithFormat:@"<%@: %p> Intent = %lu, overlayView = %@, contentView = %@, backgroundColor = %@, playlist = %@, imageProxies = %@", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
}

- (TVPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end