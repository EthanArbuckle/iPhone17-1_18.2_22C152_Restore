@interface PFXColorPaletteEntry
+ (id)colorPaletteMap;
+ (id)entryForColor:(id)a3;
+ (void)addEntryForColor:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6;
+ (void)initialize;
- (NSString)colorName;
- (PFXColorPaletteEntry)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6;
- (double)blue;
- (double)green;
- (double)red;
- (void)dealloc;
@end

@implementation PFXColorPaletteEntry

- (PFXColorPaletteEntry)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)PFXColorPaletteEntry;
  v10 = [(PFXColorPaletteEntry *)&v12 init];
  if (v10)
  {
    v10->mColorName = (NSString *)[a3 copy];
    v10->mRed = a4;
    v10->mGreen = a5;
    v10->mBlue = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXColorPaletteEntry;
  [(PFXColorPaletteEntry *)&v3 dealloc];
}

+ (id)colorPaletteMap
{
  id result = (id)qword_573708;
  if (!qword_573708)
  {
    id result = objc_alloc_init((Class)NSMutableDictionary);
    qword_573708 = (uint64_t)result;
  }
  return result;
}

+ (void)addEntryForColor:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6
{
  v8 = -[PFXColorPaletteEntry initWithColorName:red:green:blue:]([PFXColorPaletteEntry alloc], "initWithColorName:red:green:blue:", [a3 lowercaseString], a4, a5, a6);
  objc_msgSend(objc_msgSend(a1, "colorPaletteMap"), "setObject:forKey:", v8, a3);
}

+ (void)initialize
{
  [a1 addEntryForColor:@"aqua" red:0.0 green:1.0 blue:1.0];
  [a1 addEntryForColor:@"black" red:0.0 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"blue" red:0.0 green:0.0 blue:1.0];
  [a1 addEntryForColor:@"fuchsia" red:1.0 green:0.0 blue:1.0];
  [a1 addEntryForColor:@"gray" red:0.501960784 green:0.501960784 blue:0.501960784];
  [a1 addEntryForColor:@"green" red:0.0 green:0.501960784 blue:0.0];
  [a1 addEntryForColor:@"lime" red:0.0 green:1.0 blue:0.0];
  [a1 addEntryForColor:@"maroon" red:0.501960784 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"navy" red:0.0 green:0.0 blue:0.501960784];
  [a1 addEntryForColor:@"olive" red:0.501960784 green:0.501960784 blue:0.0];
  [a1 addEntryForColor:@"purple" red:0.501960784 green:0.0 blue:0.501960784];
  [a1 addEntryForColor:@"red" red:1.0 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"silver" red:0.752941176 green:0.752941176 blue:0.752941176];
  [a1 addEntryForColor:@"teal" red:0.0 green:0.501960784 blue:0.501960784];
  [a1 addEntryForColor:@"white" red:1.0 green:1.0 blue:1.0];
  [a1 addEntryForColor:@"yellow" red:1.0 green:1.0 blue:0.0];
  [a1 addEntryForColor:@"aliceblue" red:0.941176471 green:0.97254902 blue:1.0];
  [a1 addEntryForColor:@"antiquewhite"];
  [a1 addEntryForColor:@"aquamarine" red:0.498039216 green:1.0 blue:0.831372549];
  [a1 addEntryForColor:@"azure" red:0.941176471 green:1.0 blue:1.0];
  [a1 addEntryForColor:@"beige" red:0.960784314 green:0.960784314 blue:0.862745098];
  [a1 addEntryForColor:@"bisque" red:1.0];
  [a1 addEntryForColor:@"blanchedalmond" red:1.0 green:0.921568627];
  [a1 addEntryForColor:@"blueviolet" red:0.541176471 green:0.168627451 blue:0.88627451];
  [a1 addEntryForColor:@"brown"];
  [a1 addEntryForColor:@"burlywood"];
  [a1 addEntryForColor:@"cadetblue" red:0.37254902 green:0.619607843];
  [a1 addEntryForColor:@"chartreuse" red:0.498039216 green:1.0 blue:0.0];
  [a1 addEntryForColor:@"chocolate"];
  [a1 addEntryForColor:@"coral" red:1.0 green:0.498039216 blue:0.31372549];
  [a1 addEntryForColor:@"cornflowerblue" red:0.392156863 green:0.584313725 blue:0.929411765];
  [a1 addEntryForColor:@"cornsilk" red:1.0 green:0.97254902 blue:0.862745098];
  [a1 addEntryForColor:@"crimson" red:0.862745098 green:0.0784313725];
  [a1 addEntryForColor:@"cyan" red:0.0 green:1.0 blue:1.0];
  [a1 addEntryForColor:@"darkblue" red:0.0 green:0.0 blue:0.545098039];
  [a1 addEntryForColor:@"darkcyan" red:0.0 green:0.545098039 blue:0.545098039];
  [a1 addEntryForColor:@"darkgoldenrod" red:0.721568627 green:0.525490196 blue:0.0431372549];
  [a1 addEntryForColor:@"darkgray" red:0.662745098 green:0.662745098 blue:0.662745098];
  [a1 addEntryForColor:@"darkgreen" red:0.0 green:0.392156863 blue:0.0];
  [a1 addEntryForColor:@"darkkhaki" red:0.741176471 green:0.717647059 blue:0.419607843];
  [a1 addEntryForColor:@"darkmagenta" red:0.545098039 green:0.0 blue:0.545098039];
  [a1 addEntryForColor:@"darkolivegreen"];
  [a1 addEntryForColor:@"darkorange" red:1.0];
  [a1 addEntryForColor:@"darkorchid"];
  [a1 addEntryForColor:@"darkred" red:0.545098039 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"darksalmon" red:0.91372549 green:0.588235294];
  [a1 addEntryForColor:@"darkseagreen"];
  [a1 addEntryForColor:@"darkslateblue"];
  [a1 addEntryForColor:@"darkslategray" red:0.184313725 green:0.309803922 blue:0.309803922];
  [a1 addEntryForColor:@"darkturquoise" red:0.0];
  [a1 addEntryForColor:@"darkviolet" red:0.580392157 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"deeppink" red:1.0 green:0.0784313725];
  [a1 addEntryForColor:@"deepskyblue" red:0.0];
  [a1 addEntryForColor:@"dimgray" red:0.411764706 green:0.411764706 blue:0.411764706];
  [a1 addEntryForColor:@"dodgerblue" red:0.117647059];
  [a1 addEntryForColor:@"firebrick"];
  [a1 addEntryForColor:@"floralwhite" red:1.0 green:0.980392157 blue:0.941176471];
  [a1 addEntryForColor:@"forestgreen" red:0.133333333 green:0.545098039 blue:0.133333333];
  [a1 addEntryForColor:@"gainsboro" red:0.862745098 green:0.862745098 blue:0.862745098];
  [a1 addEntryForColor:@"ghostwhite" red:0.97254902 green:0.97254902 blue:1.0];
  [a1 addEntryForColor:@"gold" red:1.0 green:0.843137255 blue:0.0];
  [a1 addEntryForColor:@"goldenrod"];
  [a1 addEntryForColor:@"greenyellow" red:0.678431373 green:1.0 blue:0.184313725];
  [a1 addEntryForColor:@"honeydew" red:0.941176471 green:1.0 blue:0.941176471];
  [a1 addEntryForColor:@"hotpink" red:1.0 green:0.411764706];
  [a1 addEntryForColor:@"indianred" red:0.803921569 green:0.360784314 blue:0.360784314];
  [a1 addEntryForColor:@"indigo" red:0.294117647 green:0.0 blue:0.0];
  [a1 addEntryForColor:@"ivory" red:1.0 green:1.0 blue:0.941176471];
  [a1 addEntryForColor:@"khaki" red:0.941176471 green:0.901960784 blue:0.549019608];
  [a1 addEntryForColor:@"lavender" red:0.901960784 green:0.901960784 blue:0.980392157];
  [a1 addEntryForColor:@"lavenderblush" red:1.0 green:0.941176471 blue:0.960784314];
  [a1 addEntryForColor:@"lawngreen" red:0.48627451 green:0.988235294 blue:0.0];
  [a1 addEntryForColor:@"lemonchiffon" red:1.0 green:0.980392157 blue:0.803921569];
  [a1 addEntryForColor:@"lightblue" red:0.678431373];
  [a1 addEntryForColor:@"lightcoral" red:0.941176471 green:0.501960784 blue:0.501960784];
  [a1 addEntryForColor:@"lightcyan" red:0.878431373 green:1.0 blue:1.0];
  [a1 addEntryForColor:@"lightgoldenrodyellow" red:0.980392157 green:0.980392157 blue:0.823529412];
  [a1 addEntryForColor:@"lightgreen" red:0.564705882 green:0.933333333 blue:0.564705882];
  [a1 addEntryForColor:@"lightgrey" red:0.82745098 green:0.82745098 blue:0.82745098];
  [a1 addEntryForColor:@"lightpink" red:1.0 green:0.71372549 blue:0.756862745];
  [a1 addEntryForColor:@"lightsalmon" red:1.0 green:0.62745098 blue:0.478431373];
  [a1 addEntryForColor:@"lightseagreen" red:0.125490196 green:0.698039216 blue:0.666666667];
  [a1 addEntryForColor:@"lightskyblue" red:0.529411765 green:0.807843137 blue:0.980392157];
  [a1 addEntryForColor:@"lightslategray" red:0.466666667 green:0.533333333 blue:0.6];
  [a1 addEntryForColor:@"lightsteelblue"];
  [a1 addEntryForColor:@"lightyellow" red:1.0 green:1.0 blue:0.878431373];
  [a1 addEntryForColor:@"limegreen" red:0.196078431 green:0.803921569 blue:0.196078431];
  [a1 addEntryForColor:@"linen" red:0.980392157 green:0.941176471 blue:0.901960784];
  [a1 addEntryForColor:@"magenta" red:1.0 green:0.0 blue:1.0];
  [a1 addEntryForColor:@"mediumaquamarine" red:0.4 green:0.803921569 blue:0.666666667];
  [a1 addEntryForColor:@"mediumblue" red:0.0 green:0.0 blue:0.803921569];
  [a1 addEntryForColor:@"mediumorchid" red:0.729411765 green:0.333333333 blue:0.82745098];
  [a1 addEntryForColor:@"mediumpurple" red:0.576470588 green:0.439215686];
  [a1 addEntryForColor:@"mediumseagreen" red:0.235294118];
  [a1 addEntryForColor:@"mediumslateblue" red:0.482352941 green:0.407843137 blue:0.933333333];
  [a1 addEntryForColor:@"mediumspringgreen" red:0.0 green:0.980392157 blue:0.603921569];
  [a1 addEntryForColor:@"mediumturquoise" red:0.282352941 green:0.819607843 blue:0.8];
  [a1 addEntryForColor:@"mediumvioletred" red:0.780392157 green:0.0823529412 blue:0.521568627];
  [a1 addEntryForColor:@"midnightblue" red:0.0980392157 green:0.0980392157 blue:0.439215686];
  [a1 addEntryForColor:@"mintcream" red:0.960784314 green:1.0 blue:0.980392157];
  [a1 addEntryForColor:@"mistyrose" red:1.0 green:0.894117647];
  [a1 addEntryForColor:@"moccasin" red:1.0 green:0.894117647 blue:0.709803922];
  [a1 addEntryForColor:@"navajowhite" red:1.0 green:0.870588235 blue:0.678431373];
  [a1 addEntryForColor:@"navyblue" red:0.623529412 green:0.68627451 blue:0.874509804];
  [a1 addEntryForColor:@"oldlace" red:0.992156863 green:0.960784314 blue:0.901960784];
  [a1 addEntryForColor:@"olivedrab" red:0.419607843 green:0.556862745 blue:0.137254902];
  [a1 addEntryForColor:@"orange" red:1.0 green:0.647058824 blue:0.0];
  [a1 addEntryForColor:@"orangered" red:1.0 green:0.270588235 blue:0.0];
  [a1 addEntryForColor:@"orchid" red:0.854901961 green:0.439215686 blue:0.839215686];
  [a1 addEntryForColor:@"palegoldenrod" red:0.933333333 green:0.909803922 blue:0.666666667];
  [a1 addEntryForColor:@"palegreen" red:0.596078431 green:0.984313725 blue:0.596078431];
  [a1 addEntryForColor:@"paleturquoise" red:0.68627451 green:0.933333333 blue:0.933333333];
  [a1 addEntryForColor:@"palevioletred" red:0.858823529 green:0.439215686 blue:0.576470588];
  [a1 addEntryForColor:@"papayawhip" red:1.0 green:0.937254902 blue:0.835294118];
  [a1 addEntryForColor:@"peachpuff" red:1.0 green:0.854901961 blue:0.725490196];
  [a1 addEntryForColor:@"peru" red:0.803921569 green:0.521568627 blue:0.247058824];
  [a1 addEntryForColor:@"pink" red:1.0 green:0.752941176 blue:0.796078431];
  [a1 addEntryForColor:@"plum" red:0.866666667 green:0.62745098 blue:0.866666667];
  [a1 addEntryForColor:@"powderblue" red:0.690196078 green:0.878431373 blue:0.901960784];
  [a1 addEntryForColor:@"rosybrown" red:0.737254902 green:0.560784314 blue:0.560784314];
  [a1 addEntryForColor:@"royalblue" red:0.254901961 green:0.411764706 blue:0.882352941];
  [a1 addEntryForColor:@"saddlebrown" red:0.545098039 green:0.270588235 blue:0.0745098039];
  [a1 addEntryForColor:@"salmon" red:0.980392157 green:0.501960784 blue:0.447058824];
  [a1 addEntryForColor:@"sandybrown" red:0.956862745 green:0.643137255 blue:0.376470588];
  [a1 addEntryForColor:@"seagreen" red:0.180392157 green:0.545098039 blue:0.341176471];
  [a1 addEntryForColor:@"seashell" red:1.0 green:0.960784314 blue:0.933333333];
  [a1 addEntryForColor:@"sienna" red:0.62745098 green:0.321568627 blue:0.176470588];
  [a1 addEntryForColor:@"skyblue" red:0.529411765 green:0.807843137 blue:0.921568627];
  [a1 addEntryForColor:@"slateblue" red:0.415686275 green:0.352941176 blue:0.803921569];
  [a1 addEntryForColor:@"slategray" red:0.439215686 green:0.501960784 blue:0.564705882];
  [a1 addEntryForColor:@"snow" red:1.0 green:0.980392157 blue:0.980392157];
  [a1 addEntryForColor:@"springgreen" red:0.0 green:1.0 blue:0.498039216];
  [a1 addEntryForColor:@"steelblue" red:0.274509804 green:0.509803922 blue:0.705882353];
  [a1 addEntryForColor:@"tan" red:0.823529412 green:0.705882353 blue:0.549019608];
  [a1 addEntryForColor:@"thistle" red:0.847058824 green:0.749019608 blue:0.847058824];
  [a1 addEntryForColor:@"tomato" red:1.0 green:0.388235294 blue:0.278431373];
  [a1 addEntryForColor:@"turquoise" red:0.250980392 green:0.878431373 blue:0.815686275];
  [a1 addEntryForColor:@"violet" red:0.933333333 green:0.509803922 blue:0.933333333];
  [a1 addEntryForColor:@"wheat" red:0.960784314 green:0.870588235 blue:0.701960784];
  [a1 addEntryForColor:@"whitesmoke" red:0.960784314 green:0.960784314 blue:0.960784314];

  [a1 addEntryForColor:@"yellowgreen" red:0.545098039 green:0.803921569 blue:0.196078431];
}

+ (id)entryForColor:(id)a3
{
  id v4 = [a1 colorPaletteMap];
  id v5 = [a3 lowercaseString];

  return [v4 objectForKey:v5];
}

- (NSString)colorName
{
  return self->mColorName;
}

- (double)red
{
  return self->mRed;
}

- (double)blue
{
  return self->mBlue;
}

- (double)green
{
  return self->mGreen;
}

@end