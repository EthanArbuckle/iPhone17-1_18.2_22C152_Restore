@interface CACTextMarkerRange
+ (CACTextMarkerRange)markerRangeWithArray:(id)a3;
+ (CACTextMarkerRange)markerRangeWithNSRange:(_NSRange)a3;
+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4;
+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4 forTextElement:(id)a5;
- (BOOL)containsMarker:(id)a3;
- (BOOL)containsRange:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CACTextMarker)endMarker;
- (CACTextMarker)startMarker;
- (CACTextMarkerRange)initWithStartMarker:(id)a3 endMarker:(id)a4;
- (NSString)description;
- (_NSRange)nsRange;
- (id)array;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)nsRange;
@end

@implementation CACTextMarkerRange

+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4
{
  return +[CACTextMarkerRange markerRangeWithStartMarker:a3 endMarker:a4 forTextElement:0];
}

+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4 forTextElement:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_allocWithZone((Class)CACTextMarkerRange) initWithStartMarker:v7 endMarker:v6];

  return (CACTextMarkerRange *)v8;
}

+ (CACTextMarkerRange)markerRangeWithNSRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v6 = +[CACTextMarker markerWithIndex:](CACTextMarker, "markerWithIndex:");
    id v7 = +[CACTextMarker markerWithIndex:location + length];
    v3 = (void *)[objc_allocWithZone((Class)CACTextMarkerRange) initWithStartMarker:v6 endMarker:v7];
  }
  return (CACTextMarkerRange *)v3;
}

+ (CACTextMarkerRange)markerRangeWithArray:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 2)
  {
    id v4 = objc_allocWithZone((Class)CACTextMarker);
    v5 = [v3 objectAtIndex:0];
    id v6 = (void *)[v4 initWithData:v5];

    id v7 = objc_allocWithZone((Class)CACTextMarker);
    v8 = [v3 objectAtIndex:1];
    v9 = (void *)[v7 initWithData:v8];

    v10 = (void *)[objc_allocWithZone((Class)CACTextMarkerRange) initWithStartMarker:v6 endMarker:v9];
  }
  else
  {
    v10 = 0;
  }

  return (CACTextMarkerRange *)v10;
}

- (CACTextMarkerRange)initWithStartMarker:(id)a3 endMarker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACTextMarkerRange;
  v9 = [(CACTextMarkerRange *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_startMarker, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (CACTextMarker)startMarker
{
  return self->_startMarker;
}

- (CACTextMarker)endMarker
{
  return self->_endMarker;
}

- (_NSRange)nsRange
{
  unint64_t v3 = [(CACTextMarker *)self->_startMarker index];
  int64_t v4 = [(CACTextMarker *)self->_endMarker index] - v3;
  if (v4 < 0)
  {
    v5 = CACLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CACTextMarkerRange nsRange](v5);
    }

    int64_t v4 = 0;
  }
  NSUInteger v6 = v3;
  result.NSUInteger length = v4;
  result.NSUInteger location = v6;
  return result;
}

- (id)array
{
  unint64_t v3 = [(CACTextMarker *)self->_startMarker data];
  if (v3)
  {
    int64_t v4 = [(CACTextMarker *)self->_endMarker data];
    if (v4)
    {
      v5 = (void *)MEMORY[0x263EFF8C0];
      NSUInteger v6 = [(CACTextMarker *)self->_startMarker data];
      id v7 = [(CACTextMarker *)self->_endMarker data];
      id v8 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isEmpty
{
  startMarker = self->_startMarker;
  return !startMarker || !self->_endMarker || -[CACTextMarker isEqual:](startMarker, "isEqual:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CACTextMarkerRange allocWithZone:a3];
  startMarker = self->_startMarker;
  endMarker = self->_endMarker;
  return [(CACTextMarkerRange *)v4 initWithStartMarker:startMarker endMarker:endMarker];
}

- (unint64_t)hash
{
  unint64_t v3 = [(CACTextMarker *)self->_startMarker hash];
  return [(CACTextMarker *)self->_endMarker hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  startMarker = self->_startMarker;
  NSUInteger v6 = [v4 startMarker];
  if ([(CACTextMarker *)startMarker isEqual:v6])
  {
    endMarker = self->_endMarker;
    id v8 = [v4 endMarker];
    BOOL v9 = [(CACTextMarker *)endMarker isEqual:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)containsMarker:(id)a3
{
  id v4 = a3;
  if (+[CACTextMarker marker:self->_startMarker precedesOrEqualsMarker:v4])
  {
    BOOL v5 = +[CACTextMarker marker:v4 precedesOrEqualsMarker:self->_endMarker];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)containsRange:(id)a3
{
  id v4 = a3;
  startMarker = self->_startMarker;
  NSUInteger v6 = [v4 startMarker];
  if (+[CACTextMarker marker:startMarker precedesOrEqualsMarker:v6])
  {
    id v7 = [v4 endMarker];
    BOOL v8 = +[CACTextMarker marker:v7 precedesOrEqualsMarker:self->_endMarker];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  unint64_t v3 = [(CACTextMarker *)self->_startMarker data];
  if (v3 && ([(CACTextMarker *)self->_endMarker data], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v5 = (void *)v4;
    NSUInteger v6 = NSString;
    id v7 = [(CACTextMarker *)self->_startMarker data];
    BOOL v8 = [(CACTextMarker *)self->_endMarker data];
    BOOL v9 = [v6 stringWithFormat:@"CAC Marker Range: start: %@, end: %@", v7, v8];
  }
  else
  {
    BOOL v9 = [NSString stringWithFormat:@"CAC Marker Range: start: %ld, end: %ld, length: %ld", -[CACTextMarker index](self->_startMarker, "index"), -[CACTextMarker index](self->_endMarker, "index"), -[CACTextMarker index](self->_endMarker, "index") - -[CACTextMarker index](self->_startMarker, "index")];
  }

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMarker, 0);
  objc_storeStrong((id *)&self->_startMarker, 0);
}

- (void)nsRange
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "CACTextMarkerRange with end before start!!!!!", v1, 2u);
}

@end