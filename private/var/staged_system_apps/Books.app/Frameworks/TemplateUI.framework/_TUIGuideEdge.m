@interface _TUIGuideEdge
- ($881BB7C90C7D0DFCC1492E3DC022A30F)length;
- (_TUIGuideNode)to;
- (id)description;
- (void)setLength:(id *)a3;
- (void)setTo:(id)a3;
@end

@implementation _TUIGuideEdge

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = TUILengthDescription(*(void *)&self->_length.value, *(void *)&self->_length.max);
  v6 = +[NSString stringWithFormat:@"<%@ %p length=%@>", v4, self, v5];

  return v6;
}

- (_TUIGuideNode)to
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_to);

  return (_TUIGuideNode *)WeakRetained;
}

- (void)setTo:(id)a3
{
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)length
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_length.value;
}

- (void)setLength:(id *)a3
{
  *(void *)&self->_length.value = a3;
  *(void *)&self->_length.max = v3;
}

- (void).cxx_destruct
{
}

@end