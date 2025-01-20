@interface INStartCallIntent(Idiom)
- (id)wf_updateIdiomIfNeeded:()Idiom;
@end

@implementation INStartCallIntent(Idiom)

- (id)wf_updateIdiomIfNeeded:()Idiom
{
  if ([a1 callCapability] != 2
    || (id result = (id)[a1 preferredCallProvider], (a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    || result != (id)2)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_1F23800E0;
    return objc_msgSendSuper2(&v6, sel_wf_updateIdiomIfNeeded_, a3);
  }
  return result;
}

@end