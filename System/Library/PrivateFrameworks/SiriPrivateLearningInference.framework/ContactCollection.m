@interface ContactCollection
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC28SiriPrivateLearningInference17ContactCollection)init;
- (_TtC28SiriPrivateLearningInference17ContactCollection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContactCollection

+ (BOOL)supportsSecureCoding
{
  return byte_267EC9150;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_267EC9150 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  sub_21F2ABFB4(0, &qword_267EC9160);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_21F420338();
  id v8 = (id)sub_21F4200A8();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (_TtC28SiriPrivateLearningInference17ContactCollection)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningInference17ContactCollection *)ContactCollection.init(coder:)(a3);
}

- (_TtC28SiriPrivateLearningInference17ContactCollection)init
{
  result = (_TtC28SiriPrivateLearningInference17ContactCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end