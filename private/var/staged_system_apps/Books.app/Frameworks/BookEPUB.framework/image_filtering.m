@interface image_filtering
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation image_filtering

+ (NSString)sourceName
{
  return (NSString *)@"image_filtering.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2019 Apple Inc. All rights reserved.\nReflect.defineProperty(window,'__ibooks_image_filter',{value:{},writable:!1}),(e=>{e._addFilterSuffixToImageSRC=function(e,i){const t=new URL(e);t.searchParams.set('be_filter',i);return t.toString()},e.refetchVisibleImages=function(i){const t=document.querySelectorAll('img[src*=\"ibooksimg:\"]'),r=t.length;for (let o=0;o<r;o++)t[o].src=e._addFilterSuffixToImageSRC(t[o].src,i)}})(__ibooks_image_filter);\n";
}

@end