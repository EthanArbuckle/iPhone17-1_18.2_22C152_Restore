@interface RBMovedDisplayListContents
+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5;
- (BOOL)isEmpty;
- (CGRect)boundingRect;
- (const)_rb_contents;
- (const)_rb_xml_document;
- (id).cxx_construct;
- (id)encodedDataForDelegate:(id)a3 error:(id *)a4;
- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4;
- (void)drawInState:(_RBDrawingState *)a3;
- (void)initWithContents:(uint64_t *)a3 xmlDocument:;
- (void)renderInContext:(CGContext *)a3 options:(id)a4;
@end

@implementation RBMovedDisplayListContents

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (CGRect)boundingRect
{
  p = self->_contents._p;
  if (p)
  {
    float32x2_t v5 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)((char *)p + 320), v2, v3);
    float64x2_t v7 = vcvtq_f64_f32(v6);
    float64x2_t v8 = vcvtq_f64_f32(v5);
  }
  else
  {
    float64x2_t v8 = *(float64x2_t *)MEMORY[0x263F001A0];
    float64x2_t v7 = *(float64x2_t *)(MEMORY[0x263F001A0] + 16);
  }
  double v9 = v8.f64[1];
  double v10 = v7.f64[1];
  result.size.width = v7.f64[0];
  result.origin.x = v8.f64[0];
  result.size.height = v10;
  result.origin.y = v9;
  return result;
}

- (void).cxx_destruct
{
  value = self->_xml_document.__ptr_.__value_;
  p_xml_document = &self->_xml_document;
  uint64_t v4 = (uint64_t)value;
  p_xml_document->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)p_xml_document, v4);
  }
  p = self->_contents._p;
  if (p && atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    float64x2_t v7 = *(void (**)(void))(*(void *)p + 8);
    v7();
  }
}

- (void)initWithContents:(uint64_t *)a3 xmlDocument:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)RBMovedDisplayListContents;
  float32x2_t v5 = objc_msgSendSuper2(&v12, sel_init);
  float32x2_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5[1];
    v5[1] = *a2;
    *a2 = v7;
    uint64_t v8 = *a3;
    *a3 = 0;
    uint64_t v9 = (uint64_t)(v5 + 2);
    uint64_t v10 = v6[2];
    v6[2] = v8;
    if (v10) {
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100](v9, v10);
    }
  }
  return v6;
}

- (const)_rb_contents
{
  return self->_contents._p;
}

- (const)_rb_xml_document
{
  return self->_xml_document.__ptr_.__value_;
}

- (BOOL)isEmpty
{
  p = self->_contents._p;
  return !p || *((void *)p + 40) == 0;
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
  uint64_t v8 = *((void *)a3 + 1);
  if (!*(void *)(v8 + 24)) {
    make_contents(*((void *)a3 + 1));
  }
  p = self->_contents._p;
  if (p) {
    RB::DisplayList::Builder::draw((RB::DisplayList::Layer ***)(v8 + 16), (const RB::DisplayList::Contents *)p, (RB::DisplayList::State *)a3, a4, 0, 0);
  }
  uint64_t v10 = *(RB::XML::DisplayList **)(v8 + 304);
  if (v10)
  {
    value = self->_xml_document.__ptr_.__value_;
    if (value)
    {
      RB::XML::DisplayList::draw_list(v10, (RB::XML::Document *)a3, (_RBDrawingState *)value, v4, a4);
    }
  }
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  p = self->_contents._p;
  if (p)
  {
    render_contents(a3, (NSDictionary *)a4, (const RB::DisplayList::Contents *)p, (_RBDrawingState *)self->_xml_document.__ptr_.__value_);
    RBXMLRecorderMarkCGFrame(self, a3);
  }
}

- (void)drawInState:(_RBDrawingState *)a3
{
  LODWORD(v3) = 1.0;
  [(RBMovedDisplayListContents *)self _drawInState:a3 alpha:v3];
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  operator new();
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  return (id)encode_contents((RB::DisplayList::Contents *)self->_contents._p, a3, a4);
}

@end