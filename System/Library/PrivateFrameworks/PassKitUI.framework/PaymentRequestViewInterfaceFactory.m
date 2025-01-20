@interface PaymentRequestViewInterfaceFactory
+ (id)interfaceForConfiguration:(id)a3 withDelegate:(id)a4;
- (_TtC9PassKitUI34PaymentRequestViewInterfaceFactory)init;
@end

@implementation PaymentRequestViewInterfaceFactory

+ (id)interfaceForConfiguration:(id)a3 withDelegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  sub_1A03B57A8();
  swift_unknownObjectRelease();
  swift_getObjCClassMetadata();
  id v5 = static PaymentRequestViewInterfaceFactory.interface(forConfiguration:withDelegate:)(v4, (uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);

  return v5;
}

- (_TtC9PassKitUI34PaymentRequestViewInterfaceFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaymentRequestViewInterfaceFactory();
  return [(PaymentRequestViewInterfaceFactory *)&v3 init];
}

@end