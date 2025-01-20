@interface MFPen
+ (MFPen)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6;
+ (id)pen;
- (MFPen)init;
- (MFPen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6;
- (id)getColor;
- (int)getStyle;
- (int)getWidth;
- (int)selectInto:(id)a3;
@end

@implementation MFPen

- (MFPen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFPen;
  v11 = [(MFPen *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->m_penStyle = a3;
    v11->m_penWidth = a4;
    objc_storeStrong((id *)&v11->m_colour, a5);
    v12->m_userStyleArray = 0;
  }

  return v12;
}

- (int)selectInto:(id)a3
{
  return 0;
}

- (id)getColor
{
  return self->m_colour;
}

- (int)getStyle
{
  return self->m_penStyle;
}

+ (id)pen
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MFPen)init
{
  return [(MFPen *)self initWithStyle:5 width:0 colour:0 styleArray:0];
}

+ (MFPen)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithStyle:v8 width:v7 colour:v10 styleArray:a6];

  return (MFPen *)v11;
}

- (int)getWidth
{
  return self->m_penWidth;
}

- (void).cxx_destruct
{
}

@end